import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(LucideIcons.chartColumn, size: 48),
            const SizedBox(height: 16),
            Text('Reports', style: ShadTheme.of(context).textTheme.h2),
            const SizedBox(height: 8),
            Text(
              'Attendance reports and analytics coming soon.',
              style: ShadTheme.of(context).textTheme.muted,
            ),
          ],
        ),
      ),
    );
  }
}
