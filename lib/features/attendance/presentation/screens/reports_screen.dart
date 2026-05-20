import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geotas/features/attendance/data/models/attendance_responses.dart';
import 'package:geotas/features/attendance/presentation/widgets/attendance_table.dart';
import 'package:geotas/features/courses/providers/course_provider.dart';
import 'package:geotas/features/sessions/providers/session_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:share_plus/share_plus.dart';
import 'package:universal_html/html.dart' as html;

class ReportsScreen extends HookConsumerWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesAsync = ref.watch(courseProvider);
    final selectedCourseId = useState<String?>(null);
    final selectedSessionId = useState<String?>(null);

    final sessionsAsync = selectedCourseId.value != null
        ? ref.watch(courseSessionsProvider(selectedCourseId.value!))
        : null;

    final attendanceAsync = selectedSessionId.value != null
        ? ref.watch(sessionAttendanceProvider(selectedSessionId.value!))
        : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance Reports'),
        actions: [
          if (attendanceAsync != null && attendanceAsync.hasValue)
            IconButton(
              icon: const Icon(LucideIcons.download),
              onPressed: () => _exportCSV(attendanceAsync.value!, context),
            ),
        ],
      ),
      body: coursesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
        data: (courses) {
          final lecturerCourses = courses.where((c) => c.role == 'lecturer').toList();

          if (lecturerCourses.isEmpty) {
            return const Center(child: Text('You are not a lecturer for any course.'));
          }

          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Course Selector
                ShadSelect<String>(
                  placeholder: const Text('Select a course'),
                  options: [
                    ...lecturerCourses.map(
                      (c) => ShadOption(value: c.id, child: Text('${c.code} - ${c.title}')),
                    ),
                  ],
                  onChanged: (val) {
                    selectedCourseId.value = val;
                    selectedSessionId.value = null;
                  },
                  selectedOptionBuilder: (context, value) {
                    final c = lecturerCourses.firstWhere((c) => c.id == value);
                    return Text(c.code);
                  },
                ),
                const SizedBox(height: 16),

                // Session Selector
                if (sessionsAsync != null)
                  sessionsAsync.when(
                    loading: () => const LinearProgressIndicator(),
                    error: (err, _) => Text('Error loading sessions: $err'),
                    data: (sessions) {
                      if (sessions.isEmpty) return const Text('No sessions found for this course.');
                      return ShadSelect<String>(
                        placeholder: const Text('Select a session'),
                        options: [
                          ...sessions.map(
                            (s) => ShadOption(
                              value: s.id,
                              child: Text(s.title.isEmpty ? 'Week ${s.weekNumber}' : s.title),
                            ),
                          ),
                        ],
                        onChanged: (val) => selectedSessionId.value = val,
                        selectedOptionBuilder: (context, value) {
                          final s = sessions.firstWhere((s) => s.id == value);
                          return Text(s.title.isEmpty ? 'Week ${s.weekNumber}' : s.title);
                        },
                      );
                    },
                  ),
                
                const SizedBox(height: 24),

                // Attendance Register Table
                if (attendanceAsync != null)
                  Expanded(
                    child: attendanceAsync.when(
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (err, _) => Center(child: Text('Error: $err')),
                      data: (list) {
                        if (list.isEmpty) return const Center(child: Text('No attendance records yet.'));
                        return AttendanceTable(attendance: list);
                      },
                    ),
                  )
                else
                  const Expanded(
                    child: Center(
                      child: Text('Select a course and session to view reports'),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _exportCSV(List<DetailedAttendanceModel> list, BuildContext context) async {
    final buffer = StringBuffer();
    // Header
    buffer.writeln('Name,Matric No,Department,Method,Confidence,Mock Location,Date');
    
    // Rows
    for (final item in list) {
      final date = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse(item.markedAt));
      buffer.writeln(
        '${item.firstName} ${item.lastName},${item.matriculationNumber},${item.department},${item.method},${item.confidenceScore},${item.mockLocationDetected},$date',
      );
    }

    final csvString = buffer.toString();
    
    if (kIsWeb) {
      final bytes = utf8.encode(csvString);
      final blob = html.Blob([bytes], 'text/csv');
      final url = html.Url.createObjectUrlFromBlob(blob);
      html.AnchorElement(href: url)
        ..setAttribute('download', 'attendance_report.csv')
        ..click();
      html.Url.revokeObjectUrl(url);
    } else {
      try {
        final tempDir = await getTemporaryDirectory();
        final file = File('${tempDir.path}/attendance_report.csv');
        await file.writeAsString(csvString);
        
        await Share.shareXFiles(
          [XFile(file.path)],
          subject: 'Attendance Report',
        );
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
}
