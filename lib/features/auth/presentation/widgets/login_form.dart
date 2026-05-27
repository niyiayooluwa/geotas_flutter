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
        Text(
          'Lecturer portal',
          style: ShadTheme.of(
            context,
          ).textTheme.muted.copyWith(fontSize: 11, letterSpacing: 0.08 * 11),
        ),
        const SizedBox(height: 24),

        Text(
          'Welcome back',
          style: ShadTheme.of(
            context,
          ).textTheme.h2.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 6),
        Text(
          'Sign in with your Google account to access your dashboard.',
          style: ShadTheme.of(
            context,
          ).textTheme.muted.copyWith(fontSize: 14, height: 1.5),
        ),
        const SizedBox(height: 36),

        // Google button
        ShadButton.outline(
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
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _GoogleLogo(),
                    const SizedBox(width: 10),
                    const Text('Continue with Google'),
                  ],
                ),
        ),

        const SizedBox(height: 28),
        const Divider(),
        const SizedBox(height: 20),

        Text(
          'Students mark attendance via the mobile app.\nThis portal is for lecturers only.',
          style: ShadTheme.of(
            context,
          ).textTheme.muted.copyWith(fontSize: 12, height: 1.6),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _GoogleLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18,
      height: 18,
      child: CustomPaint(painter: _GoogleLogoPainter()),
    );
  }
}

class _GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width / 18;

    canvas.drawPath(
      Path()
        ..moveTo(17.64 * s, 9.2 * s)
        ..cubicTo(
          17.64 * s,
          8.563 * s,
          17.583 * s,
          7.949 * s,
          17.476 * s,
          7.36 * s,
        )
        ..lineTo(9 * s, 7.36 * s)
        ..lineTo(9 * s, 10.841 * s)
        ..lineTo(13.844 * s, 10.841 * s)
        ..cubicTo(
          13.635 * s,
          11.966 * s,
          13.001 * s,
          12.919 * s,
          12.048 * s,
          13.558 * s,
        )
        ..lineTo(12.048 * s, 15.816 * s)
        ..lineTo(14.956 * s, 15.816 * s)
        ..cubicTo(
          16.658 * s,
          14.249 * s,
          17.64 * s,
          11.941 * s,
          17.64 * s,
          9.2 * s,
        )
        ..close(),
      Paint()..color = const Color(0xFF4285F4),
    );
    canvas.drawPath(
      Path()
        ..moveTo(9 * s, 18 * s)
        ..cubicTo(
          11.43 * s,
          18 * s,
          13.467 * s,
          17.194 * s,
          14.956 * s,
          15.816 * s,
        )
        ..lineTo(12.048 * s, 13.558 * s)
        ..cubicTo(
          11.242 * s,
          14.098 * s,
          10.211 * s,
          14.418 * s,
          9 * s,
          14.418 * s,
        )
        ..cubicTo(
          6.656 * s,
          14.418 * s,
          4.672 * s,
          12.834 * s,
          3.964 * s,
          10.707 * s,
        )
        ..lineTo(0.957 * s, 10.707 * s)
        ..lineTo(0.957 * s, 13.039 * s)
        ..cubicTo(2.438 * s, 15.983 * s, 5.482 * s, 18 * s, 9 * s, 18 * s)
        ..close(),
      Paint()..color = const Color(0xFF34A853),
    );
    canvas.drawPath(
      Path()
        ..moveTo(3.964 * s, 10.707 * s)
        ..cubicTo(3.784 * s, 10.167 * s, 3.682 * s, 9.59 * s, 3.682 * s, 9 * s)
        ..cubicTo(
          3.682 * s,
          8.41 * s,
          3.784 * s,
          7.833 * s,
          3.964 * s,
          7.293 * s,
        )
        ..lineTo(3.964 * s, 4.961 * s)
        ..lineTo(0.957 * s, 4.961 * s)
        ..cubicTo(0.347 * s, 6.175 * s, 0 * s, 7.55 * s, 0 * s, 9 * s)
        ..cubicTo(
          0 * s,
          10.45 * s,
          0.347 * s,
          11.825 * s,
          0.957 * s,
          13.039 * s,
        )
        ..lineTo(3.964 * s, 10.707 * s)
        ..close(),
      Paint()..color = const Color(0xFFFBBC05),
    );
    canvas.drawPath(
      Path()
        ..moveTo(9 * s, 3.58 * s)
        ..cubicTo(
          10.321 * s,
          3.58 * s,
          11.508 * s,
          4.034 * s,
          12.44 * s,
          4.925 * s,
        )
        ..lineTo(15.022 * s, 2.345 * s)
        ..cubicTo(13.463 * s, 0.891 * s, 11.426 * s, 0 * s, 9 * s, 0 * s)
        ..cubicTo(5.482 * s, 0 * s, 2.438 * s, 2.017 * s, 0.957 * s, 4.961 * s)
        ..lineTo(3.964 * s, 7.293 * s)
        ..cubicTo(4.672 * s, 5.166 * s, 6.656 * s, 3.58 * s, 9 * s, 3.58 * s)
        ..close(),
      Paint()..color = const Color(0xFFEA4335),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
