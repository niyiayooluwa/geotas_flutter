import 'package:flutter/material.dart';
import 'package:geotas/core/utils/validators.dart';
import 'package:geotas/features/auth/providers/notifier/register_notifier.dart';
import 'package:geotas/features/auth/providers/state/register_state.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class RegisterForm extends HookConsumerWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = useRegisterForm();
    final vm = ref.watch(registerProvider);
    final isLoading = vm.isLoading;

    // Listen for errors and show toast
    ref.listen(registerProvider, (_, next) {
      next.whenOrNull(
        error: (error, _) {
          ShadToaster.of(context).show(
            ShadToast.destructive(
              title: const Text('Registration failed'),
              description: Text(error.toString()),
            ),
          );
        },
      );
    });

    return ShadForm(
      key: form.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Text(
            'Create your account',
            style: ShadTheme.of(context).textTheme.h2,
          ),
          const SizedBox(height: 8),

          Text(
            "Let's get you set up!",
            style: ShadTheme.of(context).textTheme.muted,
          ),
          const SizedBox(height: 32),

          // First name field
          ShadInputFormField(
            id: 'first_name',
            controller: form.firstNameController,
            label: const Text('First name'),
            placeholder: const Text('John'),
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 16),

          // Last name field
          ShadInputFormField(
            id: 'last_name',
            controller: form.lastNameController,
            label: const Text('Last name'),
            placeholder: const Text('Doe'),
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 16),

          ShadInputFormField(
            id: 'department',
            controller: form.departmentController,
            label: const Text('Department'),
            placeholder: const Text('Software Engineering'),
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 16),

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

          // Confirm Password field
          ValueListenableBuilder(
            valueListenable: form.isConfirmPasswordVisible,
            builder: (context, isVisible, _) {
              return ShadInputFormField(
                id: 'confirm_password',
                controller: form.confirmPasswordController,
                label: const Text('Confirm Password'),
                placeholder: const Text('••••••••'),
                obscureText: !isVisible,
                validator: (value) => value != form.passwordController.text
                    ? 'Passwords do not match'
                    : null,
                trailing: GestureDetector(
                  onTap: () => form.isConfirmPasswordVisible.value = !isVisible,
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
                              .read(registerProvider.notifier)
                              .register(
                                firstName: form.firstNameController.text.trim(),
                                lastName: form.lastNameController.text.trim(),
                                department: form.departmentController.text
                                    .trim(),
                                email: form.emailController.text.trim(),
                                password: form.passwordController.text,
                              );
                          if (success && context.mounted) {
                            context.go('/login');
                          }
                        }
                      },
                child: isLoading
                    ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Create an Account'),
              );
            },
          ),
          const SizedBox(height: 16),

          // Register link
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: ShadTheme.of(context).textTheme.muted,
              ),
              GestureDetector(
                onTap: () => context.go('/login'),
                child: Text(
                  'Sign in here',
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
