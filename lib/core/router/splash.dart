import 'package:flutter/foundation.dart'; // Required for kIsWeb
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart'; // Added hooks
import 'package:go_router/go_router.dart';
import 'package:geotas/core/storage/secure_storage.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // useEffect replaces initState. The empty list [] ensures it runs only once.
    useEffect(() {
      Future<void> navigate() async {
        final storage = SecureStorage();
        final results = await Future.wait([
          storage.getToken(),
          storage.getRole(),
          // Skip the artificial delay entirely if running on the web
          if (!kIsWeb) Future.delayed(const Duration(milliseconds: 3000)),
        ]);

        final token = results[0] as String?;
        final role = results[1] as String?;

        if (context.mounted) {
          if (token != null) {
            if (role == 'lecturer') {
              context.go('/lecturer/home');
            } else {
              context.go('/courses');
            }
          } else {
            context.go('/login');
          }
        }
      }

      navigate();
      return null; // No cleanup needed
    }, []);

    // Return a simple loader for the web during the split-second token check
    if (kIsWeb) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width * 0.6,
            ),
            child: const ShadProgress(),
          ),
        ),
      );
    }

    // Keep the animated splash screen for the mobile app
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
