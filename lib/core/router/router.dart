import 'package:flutter/material.dart';
import 'package:geotas/core/storage/secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

// A single navigator key shared across the app.
// GoRouter uses this to control navigation from outside the widget tree.
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,

    // App always starts at login — the redirect below will push
    // authenticated users to the dashboard immediately if a token exists.
    initialLocation: '/login',

    // redirect runs before every navigation event.
    // It checks SecureStorage for a token and enforces auth guards.
    // Returns a path to redirect to, or null to allow the navigation through.
    redirect: (BuildContext context, GoRouterState state) async {
      final storage = ref.read(secureStorageProvider);
      final token = await storage.getToken();

      final bool isLoggedIn = token != null;
      final bool isGoingToAuth =
          state.matchedLocation == '/login' ||
          state.matchedLocation == '/register';

      // Unauthenticated user trying to access a protected route → login
      if (!isLoggedIn && !isGoingToAuth) return '/login';

      // Authenticated user trying to access auth screens → dashboard
      // Role-based branching (lecturer vs student) will be added here
      // once the courses endpoint is wired up.
      if (isLoggedIn && isGoingToAuth) return '/dashboard';

      // No redirect needed
      return null;
    },

    routes: <RouteBase>[
      /*GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const AuthScreen();
        },
      ),
      GoRoute(
        path: '/register',
        builder: (BuildContext context, GoRouterState state) {
          return const AuthScreen();
        },
      ),*/
      GoRoute(
        path: '/dashboard',
        builder: (BuildContext context, GoRouterState state) {
          // Placeholder — will be replaced with role-based
          // branching to LecturerDashboard or StudentDashboard.
          return const Scaffold(
            body: Center(child: Text('Dashboard Placeholder')),
          );
        },
      ),
    ],
  );
}