import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LecturerHomeScreen extends StatelessWidget {
  const LecturerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lecturer Dashboard'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(LucideIcons.graduationCap, size: 64),
            const SizedBox(height: 16),
            Text(
              'Welcome, Lecturer!',
              style: ShadTheme.of(context).textTheme.h2,
            ),
          ],
        ),
      ),
    );
  }
}
