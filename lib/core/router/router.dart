import 'package:flutter/material.dart';
import 'package:geotas/core/router/splash.dart';
import 'package:geotas/core/router/widgets/app_layout.dart';
import 'package:geotas/core/storage/secure_storage.dart';
import 'package:geotas/features/attendance/presentation/screens/course_attendance_screen.dart'; // <-- Added import
import 'package:geotas/features/attendance/presentation/screens/reports_screen.dart';
import 'package:geotas/features/attendance/presentation/screens/scan_screen.dart';
import 'package:geotas/features/attendance/presentation/screens/student_session_screen.dart';
import 'package:geotas/features/auth/presentation/screens/login_screen.dart';
import 'package:geotas/features/auth/presentation/screens/profile_screen.dart';
import 'package:geotas/features/auth/presentation/screens/settings_screen.dart';
import 'package:geotas/features/courses/presentation/screens/course_detail_screen.dart';
import 'package:geotas/features/courses/presentation/screens/course_screen.dart';
import 'package:geotas/features/sessions/presentation/screens/active_session_screen.dart';
import 'package:geotas/features/sessions/presentation/screens/session_attendance_details_screen.dart';
import 'package:geotas/features/sessions/presentation/screens/session_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',

    redirect: (BuildContext context, GoRouterState state) async {
      if (state.matchedLocation == '/splash') return null;

      final storage = SecureStorage();
      final token = await storage.getToken();

      final bool isLoggedIn = token != null;
      final bool isGoingToAuth = state.matchedLocation == '/login';

      if (!isLoggedIn && !isGoingToAuth) return '/login';
      if (isLoggedIn && isGoingToAuth) return '/courses';

      return null;
    },

    routes: <RouteBase>[
      //=========================
      // PRE_AUTHENTICATION ROUTES
      //=========================
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),

      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),

      //=========================
      // AUTHENTICATED ROUTES
      //=========================
      ShellRoute(
        builder: (context, state, child) => AppLayout(child: child),
        routes: [
          GoRoute(
            path: '/courses',
            builder: (context, state) => const CoursesScreen(),
          ),
          GoRoute(
            path: '/courses/:id',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return CourseDetailScreen(courseId: id);
            },
          ),
          GoRoute(
            path: '/courses/:id/attendance',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              final code = state.uri.queryParameters['code'] ?? 'Course';
              final title = state.uri.queryParameters['title'] ?? 'Register';
              
              return CourseAttendanceScreen(
                courseId: id,
                courseCode: code,
                courseTitle: title,
              );
            },
          ),
          //=========================
          GoRoute(
            path: '/sessions',
            builder: (context, state) => const SessionScreen(),
          ),
          GoRoute(
            path: '/reports',
            builder: (context, state) => const ReportsScreen(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
          GoRoute(
            path: '/sessions/:id/live',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return ActiveSessionScreen(sessionId: id);
            },
          ),
          GoRoute(
            path: '/sessions/:id/attendance',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              final title =
                  state.uri.queryParameters['title'] ?? 'Session Attendance';
              return SessionAttendanceDetailsScreen(
                sessionId: id,
                sessionTitle: title,
              );
            },
          ),
          GoRoute(
            path: '/sessions/:id/student',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return StudentSessionScreen(sessionId: id);
            },
          ),
          GoRoute(
            path: '/scan',
            builder: (context, state) {
              final sessionId = state.uri.queryParameters['sessionId'];
              return ScanScreen(sessionId: sessionId);
            },
          ),
        ],
      ),
    ],
  );
}