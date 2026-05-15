import 'package:flutter/material.dart';
import 'package:geotas/core/utils/validators.dart';
import 'package:geotas/features/auth/providers/notifier/login_notifier.dart';
import 'package:geotas/features/auth/providers/state/login_state.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginForm extends HookConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = useLoginForm();
    final vm = ref.watch(loginProvider);
    final isLoading = vm.isLoading;

    // Listen for errors and show toast
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Text('Welcome back', style: ShadTheme.of(context).textTheme.h2),
          const SizedBox(height: 8),
          Text(
            'Sign in to your GEOTAS account',
            style: ShadTheme.of(context).textTheme.muted,
          ),
          const SizedBox(height: 32),

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
                  onTap: () =>
                      form.isPasswordVisible.value = !isVisible,
                  child: Icon(
                    isVisible ? Icons.visibility_off : Icons.visibility,
                    size: 18,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),

          // Submit button
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
                child: isLoading
                    ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Sign in'),
              );
            },
          ),
          const SizedBox(height: 16),

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
                  'Sign up',
                  style: ShadTheme.of(
                    context,
                  ).textTheme.p.copyWith(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
