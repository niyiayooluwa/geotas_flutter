import 'package:flutter/material.dart';
import 'package:geotas/core/errors/failures.dart';
import 'package:geotas/core/utils/toast_helper.dart';
import 'package:geotas/core/utils/validators.dart';
import 'package:geotas/features/auth/providers/notifier/register_notifier.dart';
import 'package:geotas/features/auth/providers/state/register_state.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class RegisterForm extends HookConsumerWidget {
  const RegisterForm({super.key, this.showLogo = true});

  final bool showLogo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = useRegisterForm();
    final vm = ref.watch(registerProvider);
    final isLoading = vm.isLoading;
    /*final isCurrentThemeDark =
        MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    final logo = isCurrentThemeDark
        ? 'assets/svgs/logo-white.svg'
        : 'assets/svgs/logo-black.svg';*/

    ref.listen(registerProvider, (_, next) {
      next.whenOrNull(
        error: (error, _) {
          showErrorToast(
            context,
            error is Failure ? error : const ServerFailure(),
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
          // Logo mark — hidden on desktop where the left panel already shows it
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
            'Create your\nAccount',
            style: ShadTheme.of(context).textTheme.h1.copyWith(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Let's get you set up",
            style: ShadTheme.of(context).textTheme.muted,
          ),
          const SizedBox(height: 28),

          // First name + Last name — side by side
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ShadInputFormField(
                  id: 'first_name',
                  controller: form.firstNameController,
                  label: const Text('First name'),
                  placeholder: const Text('John'),
                  keyboardType: TextInputType.name,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ShadInputFormField(
                  id: 'last_name',
                  controller: form.lastNameController,
                  label: const Text('Last name'),
                  placeholder: const Text('Doe'),
                  keyboardType: TextInputType.name,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Department
          ShadInputFormField(
            id: 'department',
            controller: form.departmentController,
            label: const Text('Department'),
            placeholder: const Text('Software Engineering'),
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 16),

          // Email
          ShadInputFormField(
            id: 'email',
            controller: form.emailController,
            label: const Text('Email'),
            placeholder: const Text('you@university.edu'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) => validateEmail(value),
          ),
          const SizedBox(height: 16),

          // Password
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
          const SizedBox(height: 16),

          // Confirm password
          ValueListenableBuilder(
            valueListenable: form.isConfirmPasswordVisible,
            builder: (context, isVisible, _) {
              return ShadInputFormField(
                id: 'confirm_password',
                controller: form.confirmPasswordController,
                label: const Text('Confirm password'),
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
                width: double.infinity,
                child: isLoading
                    ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Create Account'),
              );
            },
          ),
          const SizedBox(height: 24),

          // Login link
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account? ',
                style: ShadTheme.of(context).textTheme.muted,
              ),
              GestureDetector(
                onTap: () => context.go('/login'),
                child: Text(
                  'Sign in',
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
