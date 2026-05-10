import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:geotas/student/router/student_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();

  runApp(
    UncontrolledProviderScope(container: container, child: const StudentApp()),
  );
}

class StudentApp extends ConsumerWidget {
  const StudentApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(studentRouteProvider);

    return ShadApp.router(
      title: 'GEOTAS',
      theme: ShadThemeData(colorScheme: const ShadBlueColorScheme.light()),
      darkTheme: ShadThemeData(colorScheme: const ShadBlueColorScheme.dark()),
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
