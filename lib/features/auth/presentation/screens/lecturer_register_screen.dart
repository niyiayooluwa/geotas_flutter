import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:geotas/core/errors/failures.dart';
import 'package:geotas/core/utils/toast_helper.dart';
import 'package:geotas/features/auth/presentation/widgets/image_widget.dart';
import 'package:geotas/features/auth/providers/lecturer_auth_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LecturerRegisterScreen extends HookConsumerWidget {
  const LecturerRegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ShadResponsiveBuilder(
        builder: (context, breakpoint) {
          final isDesktop = breakpoint >= ShadTheme.of(context).breakpoints.md;
          return isDesktop
              ? const _LecturerRegisterDesktopLayout()
              : const _LecturerRegisterMobileLayout();
        },
      ),
    );
  }
}

class _LecturerRegisterDesktopLayout extends StatelessWidget {
  const _LecturerRegisterDesktopLayout();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 55, child: AuthImagePanel()),
        Expanded(
          flex: 45,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: const SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 48, vertical: 64),
                child: _LecturerRegisterForm(showLogo: false),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LecturerRegisterMobileLayout extends StatelessWidget {
  const _LecturerRegisterMobileLayout();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: const SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: _LecturerRegisterForm(showLogo: true),
            ),
          ),
        ),
      ),
    );
  }
}

class _LecturerRegisterForm extends HookConsumerWidget {
  const _LecturerRegisterForm({this.showLogo = true});
  final bool showLogo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final obscurePassword = useState(true);
    final obscureConfirmPassword = useState(true);

    useListenable(passwordController);
    final passwordText = passwordController.text;
    final hasMinLength = passwordText.length >= 8;
    final hasNumber = RegExp(r'\d').hasMatch(passwordText);
    final hasUppercase = RegExp(r'[A-Z]').hasMatch(passwordText);
    final hasSpecialChar = RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(passwordText);

    ref.listen(lecturerAuthProvider, (_, next) {
      next.whenOrNull(
        error: (error, _) {
          showErrorToast(
            context,
            error is Failure ? error : ServerFailure(error.toString()),
          );
        },
      );
    });

    final authState = ref.watch(lecturerAuthProvider);
    final isLoading = authState.isLoading;

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!showLogo) ...[
            Text(
              'Lecturer portal',
              style: ShadTheme.of(context).textTheme.muted.copyWith(
                fontSize: 14,
                letterSpacing: 0.08 * 11,
              ),
            ),
            const SizedBox(height: 24),
          ],
          if (showLogo) ...[
            SvgPicture.asset(
              'assets/svgs/logo-black.svg',
              height: 32,
              fit: BoxFit.contain,
              alignment: Alignment.centerLeft,
            ),
            const SizedBox(height: 24),
          ],
          Text(
            'Create an account',
            style: ShadTheme.of(
              context,
            ).textTheme.h2.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 6),
          Text(
            'Register below to gain access to the lecturer dashboard.',
            style: ShadTheme.of(
              context,
            ).textTheme.muted.copyWith(fontSize: 14, height: 1.5),
          ),
          const SizedBox(height: 36),
          Row(
            children: [
              Expanded(
                child: ShadInputFormField(
                  label: const Text('First Name'),
                  controller: firstNameController,
                  placeholder: const Text('John'),
                  validator: (v) => v.isEmpty ? 'Required' : null,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ShadInputFormField(
                  label: const Text('Last Name'),
                  controller: lastNameController,
                  placeholder: const Text('Doe'),
                  validator: (v) => v.isEmpty ? 'Required' : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ShadInputFormField(
            label: const Text('Email'),
            controller: emailController,
            placeholder: const Text('Enter your email'),
            validator: (v) {
              if (v.isEmpty) return 'Email cannot be empty';
              if (!v.contains('@')) return 'Enter a valid email address';
              return null;
            },
          ),
          const SizedBox(height: 16),
          ShadInputFormField(
            label: const Text('Password'),
            controller: passwordController,
            placeholder: const Text('Enter your password'),
            obscureText: obscurePassword.value,
            trailing: InkWell(
              child: Icon(
                obscurePassword.value ? LucideIcons.eyeOff : LucideIcons.eye,
                size: 16,
                color: ShadTheme.of(context).colorScheme.mutedForeground,
              ),
              onTap: () => obscurePassword.value = !obscurePassword.value,
            ),
            validator: (v) {
              if (v.isEmpty) return 'Password cannot be empty';
              if (v.length < 8) return 'Password must be at least 8 characters';
              if (!v.contains(RegExp(r'\d'))) {
                return 'Password must contain at least 1 number';
              }
              if (!v.contains(RegExp(r'[A-Z]'))) {
                return 'Password must contain at least 1 uppercase letter';
              }
              if (!v.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
                return 'Password must contain at least 1 special character';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          _PasswordRequirements(
            hasMinLength: hasMinLength,
            hasNumber: hasNumber,
            hasUppercase: hasUppercase,
            hasSpecialChar: hasSpecialChar,
          ),
          const SizedBox(height: 16),
          ShadInputFormField(
            label: const Text('Confirm Password'),
            controller: confirmPasswordController,
            placeholder: const Text('Confirm your password'),
            obscureText: obscureConfirmPassword.value,
            trailing: InkWell(
              child: Icon(
                obscureConfirmPassword.value
                    ? LucideIcons.eyeOff
                    : LucideIcons.eye,
                size: 16,
                color: ShadTheme.of(context).colorScheme.mutedForeground,
              ),
              onTap: () =>
                  obscureConfirmPassword.value = !obscureConfirmPassword.value,
            ),
            validator: (v) {
              if (v.isEmpty) return 'Confirm password cannot be empty';
              if (v != passwordController.text) return 'Passwords do not match';
              return null;
            },
          ),
          const SizedBox(height: 24),
          ShadButton(
            onPressed: isLoading
                ? null
                : () async {
                    if (formKey.currentState!.validate()) {
                      await ref
                          .read(lecturerAuthProvider.notifier)
                          .register(
                            firstName: firstNameController.text.trim(),
                            lastName: lastNameController.text.trim(),
                            email: emailController.text.trim(),
                            password: passwordController.text,
                          );

                      if (!ref.read(lecturerAuthProvider).hasError) {
                        if (context.mounted) {
                          context.go('/lecturer/home');
                        }
                      }
                    }
                  },
            width: double.infinity,
            child: isLoading
                ? SizedBox(
                    height: 16,
                    width: 32,
                    child: SpinKitThreeBounce(
                      color: ShadTheme.of(context).colorScheme.primaryForeground,
                      size: 16,
                    ),
                  )
                : const Text('Register'),
          ),
          const SizedBox(height: 28),
          const Divider(),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () => context.go('/lecturer/login'),
            child: const Text('Already have an account? Login here'),
          ),
        ],
      ),
    );
  }
}

class _PasswordRequirements extends StatelessWidget {
  const _PasswordRequirements({
    required this.hasMinLength,
    required this.hasNumber,
    required this.hasUppercase,
    required this.hasSpecialChar,
  });

  final bool hasMinLength;
  final bool hasNumber;
  final bool hasUppercase;
  final bool hasSpecialChar;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _RequirementRow(isMet: hasMinLength, text: 'At least 8 characters'),
        const SizedBox(height: 6),
        _RequirementRow(isMet: hasNumber, text: 'At least 1 number'),
        const SizedBox(height: 6),
        _RequirementRow(isMet: hasUppercase, text: 'At least 1 uppercase letter'),
        const SizedBox(height: 6),
        _RequirementRow(isMet: hasSpecialChar, text: 'At least 1 special character'),
      ],
    );
  }
}

class _RequirementRow extends StatelessWidget {
  const _RequirementRow({required this.isMet, required this.text});

  final bool isMet;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Row(
      children: [
        Icon(
          isMet ? LucideIcons.circleCheckBig : LucideIcons.circle,
          size: 14,
          color: isMet ? Colors.green : theme.colorScheme.mutedForeground,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: theme.textTheme.muted.copyWith(
            fontSize: 12,
            color: isMet ? theme.colorScheme.foreground : theme.colorScheme.mutedForeground,
          ),
        ),
      ],
    );
  }
}
