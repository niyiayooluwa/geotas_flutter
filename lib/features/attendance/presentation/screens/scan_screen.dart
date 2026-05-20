import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(LucideIcons.qrCode, size: 48),
            const SizedBox(height: 16),
            Text(
              'Scan QR Code',
              style: ShadTheme.of(context).textTheme.h2,
            ),
            const SizedBox(height: 8),
            Text(
              'The QR scanner will open here.',
              style: ShadTheme.of(context).textTheme.muted,
            ),
          ],
        ),
      ),
    );
  }
}
