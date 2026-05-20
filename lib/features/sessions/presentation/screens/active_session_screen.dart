import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geotas/features/attendance/data/models/attendance_responses.dart';
import 'package:geotas/features/sessions/providers/session_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ActiveSessionScreen extends HookConsumerWidget {
  final String sessionId;

  const ActiveSessionScreen({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionAsync = ref.watch(sessionDetailsProvider(sessionId));

    return sessionAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, stack) => Scaffold(body: Center(child: Text('Error: $err'))),
      data: (session) {
        if (session == null) {
          return const Scaffold(body: Center(child: Text('Session not found')));
        }
        return _ActiveSessionContent(session: session);
      },
    );
  }
}

class _ActiveSessionContent extends HookConsumerWidget {
  final dynamic session;

  const _ActiveSessionContent({required this.session});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qrTokenAsync = ref.watch(sessionQRTokenProvider(session.id));
    final attendanceAsync = ref.watch(sessionAttendanceProvider(session.id));

    final timeLeft = useState(session.qrRotationSecs);
    final isClosing = useState(false);

    useEffect(() {
      final qrTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (timeLeft.value > 1) {
          timeLeft.value--;
        } else {
          timeLeft.value = session.qrRotationSecs;
          ref.invalidate(sessionQRTokenProvider(session.id));
        }
      });

      final attendanceTimer = Timer.periodic(const Duration(seconds: 5), (
        timer,
      ) {
        ref.invalidate(sessionAttendanceProvider(session.id));
      });

      return () {
        qrTimer.cancel();
        attendanceTimer.cancel();
      };
    }, [session.id]);

    Future<void> handleClose() async {
      isClosing.value = true;
      try {
        await ref
            .read(courseSessionsProvider(session.courseId).notifier)
            .closeSession(session.id);
        if (context.mounted) Navigator.pop(context);
      } catch (e) {
        if (context.mounted) {
          ShadToaster.of(context).show(
            ShadToast.destructive(
              title: const Text('Failed to close session'),
              description: Text(e.toString()),
            ),
          );
        }
      } finally {
        isClosing.value = false;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          session.title.isEmpty ? 'Week ${session.weekNumber}' : session.title,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'LIVE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // QR Code Section
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    qrTokenAsync.when(
                      loading: () => const SizedBox(
                        height: 200,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      error: (err, _) => SizedBox(
                        height: 200,
                        child: Center(child: Text('Error: $err')),
                      ),
                      data: (token) => QrImageView(
                        data: token.token,
                        version: QrVersions.auto,
                        size: 200.0,
                        eyeStyle: const QrEyeStyle(
                          eyeShape: QrEyeShape.square,
                          color: Colors.black,
                        ),
                        dataModuleStyle: const QrDataModuleStyle(
                          dataModuleShape: QrDataModuleShape.square,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Next rotation in ${timeLeft.value}s',
                      style: ShadTheme.of(context).textTheme.muted,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Attendance List Header
            Row(
              children: [
                Text(
                  'Live Attendance',
                  style: ShadTheme.of(context).textTheme.h3,
                ),
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

            // Attendance List
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
                  itemBuilder: (context, index) {
                    final item = list[index];
                    return _AttendanceRow(item: item);
                  },
                );
              },
            ),

            const SizedBox(height: 40),

            // Close Session Button
            ShadButton.destructive(
              width: double.infinity,
              onPressed: isClosing.value ? null : handleClose,
              child: isClosing.value
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
        ),
      ),
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
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.5),
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
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$confidence%',
                style: TextStyle(
                  fontSize: 12,
                  color: _getConfidenceColor(item.confidenceScore),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getConfidenceColor(double score) {
    if (score >= 0.8) return Colors.green;
    if (score >= 0.5) return Colors.orange;
    return Colors.red;
  }
}
