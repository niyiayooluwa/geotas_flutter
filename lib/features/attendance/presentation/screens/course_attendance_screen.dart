import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geotas/core/errors/failures.dart';
import 'package:geotas/core/router/widgets/error_view.dart';
import 'package:geotas/core/utils/toast_helper.dart';
import 'package:geotas/features/attendance/data/models/attendance_responses.dart';
import 'package:geotas/features/attendance/presentation/widgets/attendance_filter_chips.dart';
import 'package:geotas/features/attendance/presentation/widgets/attendance_metric_row.dart';
import 'package:geotas/features/attendance/presentation/widgets/student_attendance_card.dart';
import 'package:geotas/features/attendance/providers/course_attendance_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

// ignore: avoid_web_libraries_in_flutter
import 'package:universal_html/html.dart' as html;

class CourseAttendanceScreen extends HookConsumerWidget {
  final String courseId;
  final String courseCode;
  final String courseTitle;

  const CourseAttendanceScreen({
    super.key,
    required this.courseId,
    required this.courseCode,
    required this.courseTitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordsAsync = ref.watch(courseAttendanceProvider(courseId));
    final selectedWeek = useState<int?>(null);
    final isExporting = useState(false);

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.5),
          child: Container(color: Colors.grey.shade300, height: 0.5),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Attendance Register',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            Text(
              '$courseCode · $courseTitle',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ),
        actions: [
          recordsAsync.whenOrNull(
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
                      : () => _exportCSV(
                          context,
                          records,
                          isExporting,
                          courseCode,
                        ),
                ),
              ) ??
              const SizedBox.shrink(),
        ],
      ),
      body: recordsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => ErrorView(
          message: err is Failure ? err.message : err.toString(),
          onRetry: () => ref.invalidate(courseAttendanceProvider(courseId)),
        ),
        data: (records) {
          if (records.isEmpty) {
            return Center(
              child: Text(
                'No attendance records yet.',
                style: ShadTheme.of(context).textTheme.muted,
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

          return RefreshIndicator(
            onRefresh: () =>
                ref.read(courseAttendanceProvider(courseId).notifier).refresh(),
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                const SizedBox(height: 12),
                AttendanceMetricsRow(records: records),
                AttendanceFilterChips(
                  weeks: allWeeks,
                  selectedWeek: selectedWeek.value,
                  onWeekSelected: (week) => selectedWeek.value = week,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
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
            ),
          );
        },
      ),
    );
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

        await Share.shareXFiles([
          XFile(file.path, mimeType: 'text/csv'),
        ], subject: '$courseCode Attendance Register');
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
