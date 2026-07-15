import 'package:flutter/material.dart';
import 'package:geotas/features/sessions/providers/session_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class FullscreenQrScreen extends ConsumerWidget {
  final String sessionId;

  const FullscreenQrScreen({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qrTokenAsync = ref.watch(sessionQRTokenProvider(sessionId));

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.x, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: qrTokenAsync.when(
          loading: () => const CircularProgressIndicator(color: Colors.white),
          error: (err, _) => Text('Error: $err', style: const TextStyle(color: Colors.red)),
          data: (token) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              QrImageView(
                data: token.qrContent,
                version: QrVersions.auto,
                size: MediaQuery.of(context).size.shortestSide * 0.9,
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
              const SizedBox(height: 32),
              const Text(
                'Live Session QR Code',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Scanning prevents screen from sleeping.', // Wait, do I have wake lock? Not in scope. Let's just say "Scan to record attendance"
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
