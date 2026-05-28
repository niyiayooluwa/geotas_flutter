import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geotas/features/sessions/data/models/session_model.dart';
import 'package:geotas/features/sessions/presentation/widgets/attendance_panel.dart';
import 'package:geotas/features/sessions/presentation/widgets/qr_panel.dart';
import 'package:geotas/features/sessions/providers/session_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ActiveSessionContent extends HookConsumerWidget {
  final SessionModel session;

  const ActiveSessionContent({super.key, required this.session});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qrTokenAsync = ref.watch(sessionQRTokenProvider(session.id));
    final timeLeft = useState(session.qrRotationSecs);
    final isClosing = useState(false);

    // Sync countdown to actual server expiry whenever a new token arrives
    useEffect(() {
      qrTokenAsync.whenData((token) {
        final expiry = DateTime.tryParse(token.expiresAt);
        if (expiry != null) {
          final secondsLeft = expiry.difference(DateTime.now()).inSeconds;
          timeLeft.value = secondsLeft.clamp(0, session.qrRotationSecs);
        }
      });
      return null;
    }, [qrTokenAsync]);

    // Tick down every second; refetch when we hit zero
    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (timeLeft.value > 1) {
          timeLeft.value--;
        } else {
          timeLeft.value = session.qrRotationSecs;
          ref.invalidate(sessionQRTokenProvider(session.id));
        }
      });
      return timer.cancel;
    }, [session.id, session.qrRotationSecs]);

    // Poll attendance every 5 seconds
    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 5), (_) {
        ref.invalidate(sessionAttendanceProvider(session.id));
      });
      return timer.cancel;
    }, [session.id]);

    Future<void> handleClose() async {
      isClosing.value = true;
      try {
        await ref
            .read(courseSessionsProvider(session.courseId).notifier)
            .closeSession(session.id);
      } catch (e) {
        isClosing.value = false;
        if (context.mounted) {
          ShadToaster.of(context).show(
            ShadToast.destructive(
              title: const Text('Failed to close session'),
              description: Text(e.toString()),
            ),
          );
        }
      }
    }

    return Column(
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                const BackButton(),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    session.title.isEmpty
                        ? 'Week ${session.weekNumber}'
                        : session.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
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
              ],
            ),
          ),
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isWideScreen = constraints.maxWidth >= 800;

              final qrPanel = QrPanel(
                session: session,
                timeLeft: timeLeft.value,
                isWideScreen: isWideScreen,
              );

              final attendancePanel = AttendancePanel(
                session: session,
                isClosing: isClosing.value,
                onClose: handleClose,
              );

              if (isWideScreen) {
                return Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 6,
                        child: SingleChildScrollView(
                          child: Center(child: qrPanel),
                        ),
                      ),
                      const SizedBox(width: 48),
                      Expanded(
                        flex: 4,
                        child: SingleChildScrollView(child: attendancePanel),
                      ),
                    ],
                  ),
                );
              }

              return SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    qrPanel,
                    const SizedBox(height: 32),
                    attendancePanel,
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}