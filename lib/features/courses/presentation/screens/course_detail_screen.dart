import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geotas/core/errors/failures.dart';
import 'package:geotas/core/router/widgets/error_view.dart';
import 'package:geotas/core/utils/toast_helper.dart';
import 'package:geotas/features/attendance/data/models/attendance_responses.dart';
import 'package:geotas/features/attendance/presentation/widgets/attendance_filter_chips.dart';
import 'package:geotas/features/attendance/presentation/widgets/attendance_metric_row.dart';
import 'package:geotas/features/attendance/presentation/widgets/student_attendance_card.dart';
import 'package:geotas/features/attendance/providers/course_attendance_provider.dart';
import 'package:geotas/features/courses/providers/course_provider.dart';
import 'package:geotas/features/sessions/data/models/session_model.dart';
import 'package:geotas/features/sessions/presentation/widgets/create_session_dialog.dart';
import 'package:geotas/features/sessions/providers/session_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:share_plus/share_plus.dart';

// ignore: avoid_web_libraries_in_flutter
import 'package:universal_html/html.dart' as html;

class CourseDetailScreen extends HookConsumerWidget {
  final String courseId;

  const CourseDetailScreen({super.key, required this.courseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesAsync = ref.watch(courseProvider);
    // Track active tab so the AppBar export button can appear contextually
    final activeTab = useState('sessions');

    return coursesAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, stack) => ErrorView(
        message: err is Failure ? err.message : 'Something went wrong.',
        onRetry: () => ref.invalidate(courseProvider),
      ),
      data: (courses) {
        final course = courses.firstWhere(
          (c) => c.id == courseId,
          orElse: () => throw 'Course not found',
        );

        final isLecturer = course.role == 'lecturer';

        return Scaffold(
          appBar: AppBar(
            title: Text(course.code),
            actions: [
              // Export button only visible when Register tab is active
              if (isLecturer && activeTab.value == 'register')
                _RegisterExportButton(
                  courseId: courseId,
                  courseCode: course.code,
                ),
              if (isLecturer)
                IconButton(
                  icon: const Icon(LucideIcons.settings),
                  onPressed: () => context.push('/courses/$courseId/settings'),
                ),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () =>
                ref.read(courseSessionsProvider(courseId).notifier).refresh(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Course Header Info
                  Text(course.title, style: ShadTheme.of(context).textTheme.h3),
                  const SizedBox(height: 8),

                  Text(
                    course.department,
                    style: ShadTheme.of(context).textTheme.muted,
                  ),
                  const SizedBox(height: 16),

                  if (isLecturer) ...[
                    // Invite Code Card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Invite Code',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  course.inviteCode,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.copy),
                            onPressed: () {
                              Clipboard.setData(
                                ClipboardData(text: course.inviteCode),
                              );
                              ShadToaster.of(context).show(
                                const ShadToast(
                                  title: Text('Invite code copied'),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],

                  // ── Sessions / Register segmented tab (lecturer only) ──
                  if (isLecturer)
                    ShadTabs<String>(
                      value: activeTab.value,
                      onChanged: (v) => activeTab.value = v,
                      tabs: [
                        ShadTab(
                          value: 'sessions',
                          content: _SessionsTabContent(courseId: courseId),
                          child: const Text('Sessions'),
                        ),
                        ShadTab(
                          value: 'register',
                          content: _RegisterTabContent(courseId: courseId),
                          child: const Text('Register'),
                        ),
                      ],
                    ),

                  // ── Student view: just the sessions list ──
                  if (!isLecturer) ...[
                    Text(
                      'Sessions',
                      style: ShadTheme.of(context).textTheme.h3,
                    ),
                    const SizedBox(height: 16),
                    _SessionList(courseId: courseId, isLecturer: false),
                  ],

                  const SizedBox(height: 24),

                  if (isLecturer)
                    ShadButton.destructive(
                      width: double.infinity,
                      onPressed: () async {
                        final confirm = await showShadDialog<bool>(
                          context: context,
                          builder: (dialogContext) => ShadDialog.alert(
                            title: const Text('Delete Course?'),
                            description: const Text(
                              'This will permanently delete the course and all its sessions and attendance records.',
                            ),
                            actions: [
                              ShadButton.outline(
                                onPressed: () =>
                                    Navigator.of(dialogContext).pop(false),
                                child: const Text('Cancel'),
                              ),
                              ShadButton.destructive(
                                onPressed: () =>
                                    Navigator.of(dialogContext).pop(true),
                                child: const Text('Delete'),
                              ),
                            ],
                          ),
                        );
                        if (confirm == true && context.mounted) {
                          try {
                            await ref
                                .read(courseProvider.notifier)
                                .deleteCourse(courseId);
                            if (context.mounted) context.pop();
                          } catch (e) {
                            if (context.mounted) {
                              showErrorToast(
                                context,
                                e is Failure
                                    ? e
                                    : const ServerFailure(
                                        'Failed to delete course',
                                      ),
                              );
                            }
                          }
                        }
                      },
                      child: const Text('Delete Course'),
                    ),

                  if (!isLecturer)
                    ShadButton.outline(
                      width: double.infinity,
                      onPressed: () async {
                        final confirm = await showShadDialog<bool>(
                          context: context,
                          builder: (dialogContext) => ShadDialog.alert(
                            title: const Text('Leave Course?'),
                            description: const Text(
                              'Your attendance records for this course will be deleted.',
                            ),
                            actions: [
                              ShadButton.outline(
                                onPressed: () =>
                                    Navigator.of(dialogContext).pop(false),
                                child: const Text('Cancel'),
                              ),
                              ShadButton.destructive(
                                onPressed: () =>
                                    Navigator.of(dialogContext).pop(true),
                                child: const Text('Leave'),
                              ),
                            ],
                          ),
                        );
                        if (confirm == true && context.mounted) {
                          try {
                            await ref
                                .read(courseProvider.notifier)
                                .leaveCourse(courseId);
                            if (context.mounted) context.pop();
                          } catch (e) {
                            if (context.mounted) {
                              showErrorToast(
                                context,
                                e is Failure
                                    ? e
                                    : const ServerFailure(
                                        'Failed to leave course',
                                      ),
                              );
                            }
                          }
                        }
                      },
                      child: const Text('Leave Course'),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// ─── Sessions tab content ────────────────────────────────────────────────────

class _SessionsTabContent extends ConsumerWidget {
  final String courseId;

  const _SessionsTabContent({required this.courseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Sessions', style: ShadTheme.of(context).textTheme.h4),
              const Spacer(),
              ShadButton(
                onPressed: () => showCreateSessionDialog(context, courseId),
                child: const Text('Start Session'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _SessionList(courseId: courseId, isLecturer: true),
        ],
      ),
    );
  }
}

// ─── Register tab content ────────────────────────────────────────────────────

class _RegisterTabContent extends HookConsumerWidget {
  final String courseId;

  const _RegisterTabContent({required this.courseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordsAsync = ref.watch(courseAttendanceProvider(courseId));
    final selectedWeek = useState<int?>(null);

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: recordsAsync.when(
        loading: () => const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: CircularProgressIndicator(),
          ),
        ),
        error: (err, _) => ErrorView(
          message: err is Failure ? err.message : err.toString(),
          onRetry: () => ref.invalidate(courseAttendanceProvider(courseId)),
        ),
        data: (records) {
          if (records.isEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: Text(
                  'No attendance records yet.',
                  style: ShadTheme.of(context).textTheme.muted,
                ),
              ),
            );
          }

          final allWeeks = records.map((r) => r.weekNumber).toSet().toList()
            ..sort();
          final filtered = selectedWeek.value == null
              ? records
              : records
                    .where((r) => r.weekNumber == selectedWeek.value)
                    .toList();

          final Map<String, List<DetailedAttendanceModel>> byStudent = {};
          for (final r in records) {
            byStudent.putIfAbsent(r.userId, () => []).add(r);
          }

          final studentIds = selectedWeek.value == null
              ? byStudent.keys.toList()
              : filtered.map((r) => r.userId).toSet().toList();

          studentIds.sort((a, b) {
            final aName = byStudent[a]!.first.lastName;
            final bName = byStudent[b]!.first.lastName;
            return aName.compareTo(bName);
          });

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AttendanceMetricsRow(records: records),
              AttendanceFilterChips(
                weeks: allWeeks,
                selectedWeek: selectedWeek.value,
                onWeekSelected: (week) => selectedWeek.value = week,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Text(
                  'STUDENTS',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              ...studentIds.map(
                (uid) => StudentAttendanceCard(
                  studentRecords: byStudent[uid]!,
                  allWeeks: allWeeks,
                  filterWeek: selectedWeek.value,
                ),
              ),
              const SizedBox(height: 24),
            ],
          );
        },
      ),
    );
  }
}

// ─── Export button (shown in AppBar only on Register tab) ────────────────────

class _RegisterExportButton extends HookConsumerWidget {
  final String courseId;
  final String courseCode;

  const _RegisterExportButton({
    required this.courseId,
    required this.courseCode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordsAsync = ref.watch(courseAttendanceProvider(courseId));
    final isExporting = useState(false);

    return recordsAsync.whenOrNull(
          data: (records) => IconButton(
            tooltip: 'Export CSV',
            icon: isExporting.value
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.download_outlined),
            onPressed: isExporting.value
                ? null
                : () => _exportCSV(context, records, isExporting, courseCode),
          ),
        ) ??
        const SizedBox.shrink();
  }

  Future<void> _exportCSV(
    BuildContext context,
    List<DetailedAttendanceModel> records,
    ValueNotifier<bool> isExporting,
    String courseCode,
  ) async {
    isExporting.value = true;
    try {
      final csv = _buildCSV(records);
      final fileName = '${courseCode.replaceAll(' ', '_')}_attendance.csv';

      if (kIsWeb) {
        final bytes = Uint8List.fromList(csv.codeUnits);
        final blob = html.Blob([bytes], 'text/csv');
        final url = html.Url.createObjectUrlFromBlob(blob);
        final _ = html.AnchorElement(href: url)
          ..setAttribute('download', fileName)
          ..click();
        html.Url.revokeObjectUrl(url);
      } else {
        final dir = await getTemporaryDirectory();
        final file = File('${dir.path}/$fileName');
        await file.writeAsString(csv);
        await Share.shareXFiles(
          [XFile(file.path, mimeType: 'text/csv')],
          subject: '$courseCode Attendance Register',
        );
      }

      if (context.mounted) {
        showSuccessToast(context, 'Register exported successfully');
      }
    } catch (e) {
      if (context.mounted) {
        showErrorToast(
          context,
          e is Failure
              ? e
              : const ServerFailure('Attendance register export failed'),
        );
      }
    } finally {
      isExporting.value = false;
    }
  }

  String _buildCSV(List<DetailedAttendanceModel> records) {
    final allWeeks = records.map((r) => r.weekNumber).toSet().toList()..sort();
    final Map<String, List<DetailedAttendanceModel>> byStudent = {};

    for (final r in records) {
      byStudent.putIfAbsent(r.userId, () => []).add(r);
    }

    final buffer = StringBuffer();
    final weekHeaders = allWeeks.map((w) => 'Week $w').join(',');
    buffer.writeln(
      'Last Name,First Name,Matric Number,$weekHeaders,Present,Absent,Avg Score',
    );

    final studentIds = byStudent.keys.toList()
      ..sort(
        (a, b) => byStudent[a]!.first.lastName.compareTo(
          byStudent[b]!.first.lastName,
        ),
      );

    for (final uid in studentIds) {
      final studentRecords = byStudent[uid]!;
      final first = studentRecords.first;
      final presentWeeks = studentRecords.map((r) => r.weekNumber).toSet();

      final weekCells = allWeeks
          .map((w) => presentWeeks.contains(w) ? '1' : '0')
          .join(',');

      final present = presentWeeks.length;
      final absent = allWeeks.length - present;
      final avgScore =
          studentRecords.map((r) => r.confidenceScore).reduce((a, b) => a + b) /
          studentRecords.length;

      buffer.writeln(
        '"${first.lastName}","${first.firstName}","${first.matriculationNumber}",$weekCells,$present,$absent,${avgScore.toStringAsFixed(2)}',
      );
    }

    return buffer.toString();
  }
}

// ─── Session list ────────────────────────────────────────────────────────────

class _SessionList extends ConsumerWidget {
  final String courseId;
  final bool isLecturer;

  const _SessionList({required this.courseId, required this.isLecturer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsAsync = ref.watch(courseSessionsProvider(courseId));

    Future<void> confirmAndDelete(
      BuildContext context,
      WidgetRef ref,
      SessionModel session,
    ) async {
      final confirm = await showShadDialog<bool>(
        context: context,
        builder: (dialogContext) => ShadDialog.alert(
          title: const Text('Delete Session?'),
          description: Text(
            'Are you sure you want to delete "${session.title.isEmpty ? 'Week ${session.weekNumber}' : session.title}"? All attendance data will be lost.',
          ),
          actions: [
            ShadButton.outline(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('Cancel'),
            ),
            ShadButton.destructive(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text('Delete'),
            ),
          ],
        ),
      );

      if (confirm == true && context.mounted) {
        try {
          await ref
              .read(courseSessionsProvider(session.courseId).notifier)
              .deleteSession(session.id);

          if (context.mounted) {
            showSuccessToast(context, 'Session deleted successfully.');
          }
        } catch (e) {
          if (context.mounted) {
            showErrorToast(
              context,
              e is Failure
                  ? e
                  : const ServerFailure('Failed to delete session.'),
            );
          }
        }
      }
    }

    return sessionsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => ErrorView(
        message: err is Failure ? err.message : 'Something went wrong.',
        onRetry: () => ref.invalidate(courseSessionsProvider(courseId)),
      ),
      data: (sessions) {
        if (sessions.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Text(
                'No sessions yet',
                style: ShadTheme.of(context).textTheme.muted,
              ),
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: sessions.length,
          itemBuilder: (context, index) {
            final session = sessions[index];
            final isActive = session.status == 'active';
            final theme = ShadTheme.of(context);

            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: ShadTheme.of(context).colorScheme.border),
              ),
              child: InkWell(
                onTap: () {
                  if (isLecturer && isActive) {
                    context.push('/sessions/${session.id}/live');
                  } else if (!isLecturer && isActive) {
                    context.push('/sessions/${session.id}/student');
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- TOP ROW: Title & Badge ---
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              session.title.isEmpty
                                  ? 'Week ${session.weekNumber}'
                                  : session.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Status Badge
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: isActive
                                      ? theme.colorScheme.primary.withValues(alpha: 0.1)
                                      : theme.colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: isActive
                                        ? theme.colorScheme.primary.withValues(alpha: 0.3)
                                        : theme.colorScheme.border,
                                  ),
                                ),
                                child: Text(
                                  isActive ? 'LIVE' : 'CLOSED',
                                  style: TextStyle(
                                    color: isActive
                                        ? theme.colorScheme.primary
                                        : theme.colorScheme.mutedForeground,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),

                              if (isLecturer) ...[
                                const SizedBox(width: 8),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    size: 20,
                                  ),
                                  color: theme.colorScheme.destructive,
                                  constraints: const BoxConstraints(),
                                  padding: EdgeInsets.zero,
                                  onPressed: () =>
                                      confirmAndDelete(context, ref, session),
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // --- BOTTOM ROW: Metadata ---
                      Row(
                        children: [
                          // Time Icon & Text
                          Icon(
                            Icons.access_time_rounded,
                            size: 16,
                            color: theme.colorScheme.mutedForeground,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            session.startedAt.substring(0, 10),
                            style: theme.textTheme.muted.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(width: 16),

                          // Radius Icon & Text
                          Icon(
                            Icons.my_location_rounded,
                            size: 16,
                            color: theme.colorScheme.mutedForeground,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${session.radiusMeters.toInt()}m',
                            style: theme.textTheme.muted.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
