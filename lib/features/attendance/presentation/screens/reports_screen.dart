import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geotas/core/errors/failures.dart';
import 'package:geotas/core/router/widgets/error_view.dart';
import 'package:geotas/features/attendance/data/models/attendance_responses.dart';
import 'package:geotas/features/attendance/presentation/widgets/attendance_table.dart';
import 'package:geotas/features/courses/providers/course_provider.dart';
import 'package:geotas/features/sessions/providers/session_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:share_plus/share_plus.dart';

class ReportsScreen extends HookConsumerWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesAsync = ref.watch(courseProvider);
    final selectedCourseId = useState<String?>(null);
    final selectedSessionId = useState<String?>(null);
    final isExporting = useState(false);

    final sessionsAsync = selectedCourseId.value != null
        ? ref.watch(courseSessionsProvider(selectedCourseId.value!))
        : null;

    final attendanceAsync = selectedSessionId.value != null
        ? ref.watch(sessionAttendanceProvider(selectedSessionId.value!))
        : null;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // --- Custom Header ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  const BackButton(),
                  const SizedBox(width: 8),
                  Text(
                    'Attendance Reports',
                    style: ShadTheme.of(context).textTheme.h3,
                  ),
                ],
              ),
            ),

            Expanded(
              child: coursesAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => ErrorView(
                  message: err is Failure
                      ? err.message
                      : 'Something went wrong.',
                  onRetry: () => ref.invalidate(courseProvider),
                ),
                data: (courses) {
                  final lecturerCourses = courses
                      .where((c) => c.role == 'lecturer')
                      .toList();

                  if (lecturerCourses.isEmpty) {
                    return _buildEmptyState(
                      context,
                      LucideIcons.bookX,
                      'No Courses Found',
                      'You are not assigned as a lecturer to any courses yet.',
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // --- The Filter Control Panel ---
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Theme.of(
                                context,
                              ).dividerColor.withValues(alpha: 0.3),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Report Filters',
                                style: ShadTheme.of(context).textTheme.large,
                              ),
                              const SizedBox(height: 16),

                              // Course Selector
                              ShadSelect<String>(
                                placeholder: const Text('Select a course...'),
                                options: lecturerCourses
                                    .map(
                                      (c) => ShadOption(
                                        value: c.id,
                                        child: Text('${c.code} - ${c.title}'),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (val) {
                                  selectedCourseId.value = val;
                                  selectedSessionId.value =
                                      null; // Reset session when course changes
                                },
                                selectedOptionBuilder: (context, value) {
                                  final c = lecturerCourses.firstWhere(
                                    (c) => c.id == value,
                                  );
                                  return Text(c.code);
                                },
                              ),
                              const SizedBox(height: 12),

                              // Session Selector
                              if (sessionsAsync != null)
                                sessionsAsync.when(
                                  loading: () => const Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: LinearProgressIndicator(),
                                  ),
                                  error: (err, _) => Text(
                                    'Error loading sessions: $err',
                                    style: TextStyle(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.error,
                                    ),
                                  ),
                                  data: (sessions) {
                                    if (sessions.isEmpty) {
                                      return Text(
                                        'No sessions found for this course.',
                                        style: ShadTheme.of(
                                          context,
                                        ).textTheme.muted,
                                      );
                                    }
                                    return ShadSelect<String>(
                                      placeholder: const Text(
                                        'Select a session...',
                                      ),
                                      initialValue: selectedSessionId.value,
                                      options: sessions
                                          .map(
                                            (s) => ShadOption(
                                              value: s.id,
                                              child: Text(
                                                s.title.isEmpty
                                                    ? 'Week ${s.weekNumber}'
                                                    : s.title,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (val) =>
                                          selectedSessionId.value = val,
                                      selectedOptionBuilder: (context, value) {
                                        final s = sessions.firstWhere(
                                          (s) => s.id == value,
                                        );
                                        return Text(
                                          s.title.isEmpty
                                              ? 'Week ${s.weekNumber}'
                                              : s.title,
                                        );
                                      },
                                    );
                                  },
                                ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // --- The Table View ---
                        if (attendanceAsync != null)
                          Expanded(
                            child: attendanceAsync.when(
                              loading: () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              error: (err, _) =>
                                  Center(child: Text('Error: $err')),
                              data: (list) {
                                if (list.isEmpty) {
                                  return _buildEmptyState(
                                    context,
                                    LucideIcons.users,
                                    'No Attendance Records',
                                    'No students have checked into this session yet.',
                                  );
                                }

                                return Column(
                                  children: [
                                    // Contextual Header & Export Button
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${list.length} Students',
                                          style: ShadTheme.of(
                                            context,
                                          ).textTheme.large,
                                        ),
                                        ShadButton.outline(
                                          size: ShadButtonSize.sm,
                                          onPressed: isExporting.value
                                              ? null
                                              : () async {
                                                  isExporting.value = true;
                                                  await _exportCSV(
                                                    list,
                                                    context,
                                                  );
                                                  isExporting.value = false;
                                                },
                                          child: isExporting.value
                                              ? const SizedBox(
                                                  height: 14,
                                                  width: 14,
                                                  child:
                                                      CircularProgressIndicator(
                                                        strokeWidth: 2,
                                                      ),
                                                )
                                              : const Row(
                                                  children: [
                                                    Icon(
                                                      LucideIcons.download,
                                                      size: 14,
                                                    ),
                                                    SizedBox(width: 6),
                                                    Text('Export CSV'),
                                                  ],
                                                ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),

                                    // The Data Table
                                    Expanded(
                                      child: AttendanceTable(attendance: list),
                                    ),
                                  ],
                                );
                              },
                            ),
                          )
                        else
                          Expanded(
                            child: _buildEmptyState(
                              context,
                              LucideIcons.fileSpreadsheet,
                              'Generate a Report',
                              'Select a course and session from the panel above to view attendance data.',
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable empty state UI
  Widget _buildEmptyState(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 32,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(title, style: ShadTheme.of(context).textTheme.h4),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: ShadTheme.of(context).textTheme.muted,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _exportCSV(
    List<DetailedAttendanceModel> list,
    BuildContext context,
  ) async {
    final buffer = StringBuffer();
    // Header
    buffer.writeln(
      'Name,Matric No,Department,Method,Confidence,Mock Location,Date',
    );

    // Rows
    for (final item in list) {
      final date = DateFormat(
        'yyyy-MM-dd HH:mm',
      ).format(DateTime.parse(item.markedAt));
      buffer.writeln(
        '${item.firstName} ${item.lastName},${item.matriculationNumber},${item.department},${item.method},${item.confidenceScore},${item.mockLocationDetected},$date',
      );
    }

    final csvString = buffer.toString();

    try {
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/attendance_report.csv');
      await file.writeAsString(csvString);

      await Share.shareXFiles([
        XFile(file.path),
      ], subject: 'Attendance Report');
    } catch (e) {
      if (context.mounted) {
        ShadToaster.of(context).show(
          ShadToast.destructive(
            title: const Text('Export failed'),
            description: Text(e.toString()),
          ),
        );
      }
    }
  }
}
