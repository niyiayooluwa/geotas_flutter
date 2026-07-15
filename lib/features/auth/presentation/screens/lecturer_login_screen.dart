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

class LecturerLoginScreen extends HookConsumerWidget {
  const LecturerLoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ShadResponsiveBuilder(
        builder: (context, breakpoint) {
          final isDesktop = breakpoint >= ShadTheme.of(context).breakpoints.md;
          return isDesktop
              ? const _LecturerLoginDesktopLayout()
              : const _LecturerLoginMobileLayout();
        },
      ),
    );
  }
}

class _LecturerLoginDesktopLayout extends StatelessWidget {
  const _LecturerLoginDesktopLayout();

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
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 48, vertical: 64),
                child: _LecturerLoginForm(showLogo: false),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LecturerLoginMobileLayout extends StatelessWidget {
  const _LecturerLoginMobileLayout();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: const SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: _LecturerLoginForm(showLogo: true),
            ),
          ),
        ),
      ),
    );
  }
}

class _LecturerLoginForm extends HookConsumerWidget {
  const _LecturerLoginForm({this.showLogo = true});
  final bool showLogo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final obscurePassword = useState(true);

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
            'Welcome back',
            style: ShadTheme.of(
              context,
            ).textTheme.h2.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 6),
          Text(
            'Sign in to access your dashboard.',
            style: ShadTheme.of(
              context,
            ).textTheme.muted.copyWith(fontSize: 14, height: 1.5),
          ),
          const SizedBox(height: 36),
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
                          .login(
                            emailController.text.trim(),
                            passwordController.text,
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
                : const Text('Login'),
          ),
          const SizedBox(height: 28),
          const Divider(),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () => context.go('/lecturer/register'),
            child: const Text('Don\'t have an account? Register here'),
          ),
          TextButton(
            onPressed: () => context.go('/login'),
            child: const Text('Are you a student? Sign in here'),
          ),
        ],
      ),
    );
  }
}
