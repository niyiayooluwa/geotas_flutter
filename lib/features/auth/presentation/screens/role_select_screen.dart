import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class RoleSelectScreen extends StatelessWidget {
  const RoleSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to GEOTAS',
                style: ShadTheme.of(context).textTheme.h1,
              ),
              const SizedBox(height: 8),
              Text(
                'Please select your role to continue',
                style: ShadTheme.of(context).textTheme.muted,
              ),
              const SizedBox(height: 48),
              ShadButton(
                width: 300,
                onPressed: () => context.go('/login'),
                child: const Text('I am a Student'),
              ),
              const SizedBox(height: 16),
              ShadButton.outline(
                width: 300,
                onPressed: () => context.go('/lecturer/login'),
                child: const Text('I am a Lecturer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
