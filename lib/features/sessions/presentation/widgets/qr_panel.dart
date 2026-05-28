import 'package:flutter/material.dart';
import 'package:geotas/features/sessions/data/models/session_model.dart';
import 'package:geotas/features/sessions/providers/session_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class QrPanel extends ConsumerWidget {
  final SessionModel session;
  final int timeLeft;
  final bool isWideScreen;

  const QrPanel({
    super.key,
    required this.session,
    required this.timeLeft,
    required this.isWideScreen,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qrTokenAsync = ref.watch(sessionQRTokenProvider(session.id));

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            qrTokenAsync.when(
              loading: () => SizedBox(
                height: isWideScreen ? 300 : 200,
                child: const Center(child: CircularProgressIndicator()),
              ),
              error: (err, _) => SizedBox(
                height: isWideScreen ? 300 : 200,
                child: Center(child: Text('Error: $err')),
              ),
              data: (token) => QrImageView(
                data: token.qrContent,
                version: QrVersions.auto,
                size: isWideScreen ? 550.0 : 350.0,
                backgroundColor: Colors.white,
                eyeStyle: const QrEyeStyle(
                  eyeShape: QrEyeShape.square,
                  color: Colors.black,
                ),
                dataModuleStyle: const QrDataModuleStyle(
                  dataModuleShape: QrDataModuleShape.circle,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Next rotation in ${timeLeft}s',
              style: ShadTheme.of(context).textTheme.muted,
            ),
          ],
        ),
      ),
    );
  }
}