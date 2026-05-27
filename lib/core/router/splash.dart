import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:geotas/core/storage/secure_storage.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    final results = await Future.wait([
      SecureStorage().getToken(),
      Future.delayed(const Duration(milliseconds: 3000)),
    ]);

    final token = results[0] as String?;

    if (mounted) {
      token != null ? context.go('/courses') : context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SvgPicture.asset('assets/svgs/logo-black.svg', height: 80)
            .animate(onPlay: (controller) => controller.repeat(reverse: true))
            .scale(
              end: const Offset(1.1, 1.1),
              duration: 1000.ms,
              curve: Curves.bounceIn,
            ),
      ),
    );
  }
}
