import 'package:flutter/material.dart';
import 'package:geotas/features/auth/presentation/widgets/image_widget.dart';
import 'package:geotas/features/auth/presentation/widgets/register_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class RegisterScreen extends HookConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ShadResponsiveBuilder(
        builder: (context, breakpoint) {
          final isDesktop = breakpoint >= ShadTheme.of(context).breakpoints.md;

          return isDesktop
              ? const _RegisterDesktopLayout()
              : const _RegisterMobileLayout();
        },
      ),
    );
  }
}

class _RegisterDesktopLayout extends StatelessWidget {
  const _RegisterDesktopLayout();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left panel — image + copy
        const Expanded(flex: 55, child: AuthImagePanel()),

        // Right panel — form
        Expanded(
          flex: 45,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480, minWidth: 440),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 48,
                  vertical: 64,
                ),
                child: const RegisterForm(showLogo: false),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _RegisterMobileLayout extends StatelessWidget {
  const _RegisterMobileLayout();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: const RegisterForm(),
        ),
      ),
    );
  }
}
