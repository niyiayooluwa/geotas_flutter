import 'package:flutter/material.dart';
import 'package:geotas/features/auth/presentation/widgets/login_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ShadResponsiveBuilder(
        builder: (context, breakpoint) {
          final isDesktop =
              breakpoint >= ShadTheme.of(context).breakpoints.md;

          return isDesktop
              ? const _LoginDesktopLayout()
              : const _LoginMobileLayout();
        },
      ),
    );
  }
}

class _LoginDesktopLayout extends StatelessWidget {
  const _LoginDesktopLayout();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: ShadCard(
          padding: const EdgeInsets.all(32),
          child: const LoginForm(),
        ),
      ),
    );
  }
}

class _LoginMobileLayout extends StatelessWidget {
  const _LoginMobileLayout();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: const LoginForm(),
      ),
    );
  }
}