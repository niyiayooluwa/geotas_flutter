import 'package:flutter/material.dart';
import 'package:geotas/core/errors/failures.dart';
import 'package:geotas/core/router/widgets/error_view.dart';
import 'package:geotas/features/attendance/presentation/widgets/attendance_table.dart';
import 'package:geotas/features/sessions/providers/session_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SessionAttendanceDetailsScreen extends ConsumerWidget {
  final String sessionId;
  final String sessionTitle;

  const SessionAttendanceDetailsScreen({
    super.key,
    required this.sessionId,
    required this.sessionTitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendanceAsync = ref.watch(sessionAttendanceProvider(sessionId));

    return Scaffold(
      appBar: AppBar(title: Text(sessionTitle)),
      body: attendanceAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => ErrorView(
          message: err is Failure ? err.message : 'Something went wrong.',
          onRetry: () => ref.invalidate(sessionAttendanceProvider(sessionId)),
        ),
        data: (list) {
          if (list.isEmpty) {
            return const Center(child: Text('No attendance records.'));
          }
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Attendance Register',
                  style: ShadTheme.of(context).textTheme.h3,
                ),
                const SizedBox(height: 16),
                Expanded(child: AttendanceTable(attendance: list)),
              ],
            ),
          );
        },
      ),
    );
  }
}
