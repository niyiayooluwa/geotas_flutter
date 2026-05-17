import 'package:flutter/material.dart';
import 'package:geotas/core/utils/validators.dart';
import 'package:geotas/features/auth/providers/notifier/login_notifier.dart';
import 'package:geotas/features/auth/providers/state/login_state.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginForm extends HookConsumerWidget {
  const LoginForm({super.key, this.showLogo = true});

  final bool showLogo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = useLoginForm();
    final vm = ref.watch(loginProvider);
    final isLoading = vm.isLoading;

    ref.listen(loginProvider, (_, next) {
      next.whenOrNull(
        error: (error, _) {
          ShadToaster.of(context).show(
            ShadToast.destructive(
              title: const Text('Login failed'),
              description: Text(error.toString()),
            ),
          );
        },
      );
    });

    return ShadForm(
      key: form.formKey,
      child: Column(
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

          // Heading — two-line heavy display style
          Text(
            'Sign in to your\nAccount',
            style: ShadTheme.of(context).textTheme.h1.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  height: 1.15,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Enter your email and password to log in',
            style: ShadTheme.of(context).textTheme.muted,
          ),
          const SizedBox(height: 28),

          // Email field
          ShadInputFormField(
            id: 'email',
            controller: form.emailController,
            label: const Text('Email'),
            placeholder: const Text('you@university.edu'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) => validateEmail(value),
          ),
          const SizedBox(height: 16),

          // Password field
          ValueListenableBuilder(
            valueListenable: form.isPasswordVisible,
            builder: (context, isVisible, _) {
              return ShadInputFormField(
                id: 'password',
                controller: form.passwordController,
                label: const Text('Password'),
                placeholder: const Text('••••••••'),
                obscureText: !isVisible,
                validator: (value) => validatePassword(value),
                trailing: GestureDetector(
                  onTap: () => form.isPasswordVisible.value = !isVisible,
                  child: Icon(
                    isVisible ? Icons.visibility_off : Icons.visibility,
                    size: 18,
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 24),

          // Submit button — blue, full width
          ValueListenableBuilder(
            valueListenable: form.isFormValid,
            builder: (context, isValid, _) {
              return ShadButton(
                onPressed: isLoading || !isValid
                    ? null
                    : () async {
                        if (form.formKey.currentState!.saveAndValidate()) {
                          final success = await ref
                              .read(loginProvider.notifier)
                              .login(
                                form.emailController.text.trim(),
                                form.passwordController.text,
                              );
                          if (success && context.mounted) {
                            context.go('/dashboard');
                          }
                        }
                      },
                width: double.infinity,
                child: isLoading
                    ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Log In'),
              );
            },
          ),
          const SizedBox(height: 24),

          // Register link
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: ShadTheme.of(context).textTheme.muted,
              ),
              GestureDetector(
                onTap: () => context.go('/register'),
                child: Text(
                  'Sign Up',
                  style: ShadTheme.of(context).textTheme.p.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                        decoration: TextDecoration.none,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}