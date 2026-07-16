import 'package:dart_either/dart_either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart'; // Added hooks
import 'package:geotas/core/errors/failures.dart';
import 'package:geotas/features/auth/data/models/user_model.dart';
import 'package:geotas/features/auth/data/repositories/auth_repository.dart';
import 'package:go_router/go_router.dart';
import 'package:geotas/core/storage/secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // useEffect replaces initState. The empty list [] ensures it runs only once.
    useEffect(() {
      Future<void> navigate() async {
        final storage = SecureStorage();
        final token = await storage.getToken();

        // If no token stored -> route to role-select/login directly, skip network call
        if (token == null) {
          await Future.delayed(const Duration(milliseconds: 3000));
          if (context.mounted) context.go('/login');
          return;
        }

        // Token present -> call GET /me
        final apiCall = ref.read(authRepositoryProvider).getMe();
        
        final results = await Future.wait([
          apiCall,
          Future.delayed(const Duration(milliseconds: 3000)),
        ]);

        final result = results[0] as Either<Failure, UserModel>;

        if (context.mounted) {
          result.fold(
            ifLeft: (failure) {
              // 401/error -> clear stored token+role, route to login
              storage.deleteToken();
              storage.deleteRole();
              context.go('/login');
            },
            ifRight: (user) {
              // 200 -> route by returned role
              storage.saveRole(user.role);
              if (user.role == 'lecturer') {
                storage.deleteToken();
                storage.deleteRole();
                ShadToaster.of(context).show(
                  const ShadToast.destructive(
                    title: Text('Please use the web dashboard'),
                    description: Text('The mobile app is for students only.'),
                  ),
                );
                context.go('/login');
              } else {
                context.go('/courses');
              }
            },
          );
        }
      }

      navigate();
      return null; // No cleanup needed
    }, []);

    // Keep the animated splash screen for the mobile app
    return Scaffold(
      backgroundColor: ShadTheme.of(context).colorScheme.background,
      body: Center(
        child: SvgPicture.asset(
          Theme.of(context).brightness == Brightness.dark
              ? 'assets/svgs/logo-white.svg'
              : 'assets/svgs/logo-black.svg',
          height: 80,
        )
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
