import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(LucideIcons.settings, size: 48),
            const SizedBox(height: 16),
            Text('Settings', style: ShadTheme.of(context).textTheme.h2),
            const SizedBox(height: 8),
            Text(
              'App settings and preferences.',
              style: ShadTheme.of(context).textTheme.muted,
            ),
          ],
        ),
      ),
    );
  }
}
