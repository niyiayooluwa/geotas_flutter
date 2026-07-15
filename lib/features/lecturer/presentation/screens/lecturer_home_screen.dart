import 'package:flutter/material.dart';
import 'package:geotas/features/auth/providers/notifier/user_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LecturerHomeScreen extends HookConsumerWidget {
  const LecturerHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProvider);
    final name = userAsync.value?.firstName ?? 'Lecturer';

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
              'Welcome, $name!',
              style: ShadTheme.of(context).textTheme.h2,
            ),
          ],
        ),
      ),
    );
  }
}
