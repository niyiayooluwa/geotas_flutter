import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(LucideIcons.circleUser, size: 48, ),
            const SizedBox(height: 16),
            Text(
              'Profile',
              style: ShadTheme.of(context).textTheme.h2,
            ),
            const SizedBox(height: 8),
            Text(
              'User profile and account details.',
              style: ShadTheme.of(context).textTheme.muted,
            ),
          ],
        ),
      ),
    );
  }
}
