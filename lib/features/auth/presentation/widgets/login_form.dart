import 'package:flutter/material.dart';
import 'package:geotas/core/errors/failures.dart';
import 'package:geotas/core/utils/toast_helper.dart';
import 'package:geotas/features/auth/providers/notifier/login_notifier.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginForm extends HookConsumerWidget {
  const LoginForm({super.key, this.showLogo = true});

  final bool showLogo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(loginProvider, (_, next) {
      next.whenOrNull(
        error: (error, _) {
          showErrorToast(
            context,
            error is Failure ? error : const ServerFailure('Login failed'),
          );
        },
      );
    });

    final vm = ref.watch(loginProvider);
    final isLoading = vm.isLoading;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Logo mark
        if (showLogo) ...[
          SvgPicture.asset(
            'assets/svgs/logo-black.svg',
            height: 36,
            fit: BoxFit.contain,
            alignment: Alignment.centerLeft,
          ),
          const SizedBox(height: 28),
        ],

        // Heading
        Text(
          'Welcome to\nGEOTAS',
          style: ShadTheme.of(context).textTheme.h1.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            height: 1.15,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Sign in using your Google account to continue',
          style: ShadTheme.of(context).textTheme.muted,
        ),
        const SizedBox(height: 48),

        // Single Google Login Button
        ShadButton(
          onPressed: isLoading
              ? null
              : () async {
                  final success = await ref
                      .read(loginProvider.notifier)
                      .signInWithGoogle();
                  if (success && context.mounted) {
                    context.go('/dashboard');
                  }
                },
          width: double.infinity,
          child: isLoading
              ? const SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.login, size: 18), 
                    SizedBox(width: 8),
                    Text('Continue with Google'),
                  ],
                ),
        ),
      ],
    );
  }
}