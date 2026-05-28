import 'package:flutter/material.dart';
import 'package:geotas/features/attendance/data/models/attendance_responses.dart';
import 'package:geotas/features/sessions/data/models/session_model.dart';
import 'package:geotas/features/sessions/providers/session_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AttendancePanel extends ConsumerWidget {
  final SessionModel session;
  final bool isClosing;
  final VoidCallback onClose;

  const AttendancePanel({
    super.key,
    required this.session,
    required this.isClosing,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendanceAsync = ref.watch(sessionAttendanceProvider(session.id));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Live Attendance', style: ShadTheme.of(context).textTheme.h3),
            const Spacer(),
            attendanceAsync.when(
              data: (list) => Text(
                '${list.length} present',
                style: ShadTheme.of(context).textTheme.muted,
              ),
              loading: () => const SizedBox.shrink(),
              error: (_, _) => const SizedBox.shrink(),
            ),
          ],
        ),
        const SizedBox(height: 16),
        attendanceAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => Center(child: Text('Error: $err')),
          data: (list) {
            if (list.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Text(
                    'No one has checked in yet',
                    style: ShadTheme.of(context).textTheme.muted,
                  ),
                ),
              );
            }
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: list.length,
              separatorBuilder: (_, _) => const SizedBox(height: 8),
              itemBuilder: (context, index) =>
                  _AttendanceRow(item: list[index]),
            );
          },
        ),
        const SizedBox(height: 40),
        ShadButton.destructive(
          width: double.infinity,
          onPressed: isClosing ? null : onClose,
          child: isClosing
              ? const SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : const Text('Close Session'),
        ),
      ],
    );
  }
}

class _AttendanceRow extends StatelessWidget {
  final DetailedAttendanceModel item;

  const _AttendanceRow({required this.item});

  @override
  Widget build(BuildContext context) {
    final confidence = (item.confidenceScore * 100).toInt();

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(
          color: Theme.of(context).dividerColor.withValues(alpha: 0.5),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${item.firstName} ${item.lastName}',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    if (item.mockLocationDetected) ...[
                      const SizedBox(width: 8),
                      const Icon(
                        LucideIcons.triangleAlert,
                        size: 14,
                        color: Colors.orange,
                      ),
                    ],
                  ],
                ),
                Text(
                  item.matriculationNumber,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item.method.toUpperCase(),
                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              Text(
                '$confidence%',
                style: TextStyle(
                  fontSize: 12,
                  color: _confidenceColor(item.confidenceScore),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _confidenceColor(double score) {
    if (score >= 0.8) return Colors.green;
    if (score >= 0.5) return Colors.orange;
    return Colors.red;
  }
}