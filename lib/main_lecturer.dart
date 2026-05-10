import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:geotas/lecturer/router/lecturer_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();

  runApp(
    UncontrolledProviderScope(container: container, child: const LecturerApp()),
  );
}

class LecturerApp extends ConsumerWidget {
  const LecturerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(lecturerRouteProvider);

    return ShadApp.router(
      title: 'GEOTAS',
      theme: ShadThemeData(colorScheme: const ShadBlueColorScheme.light()),
      darkTheme: ShadThemeData(colorScheme: const ShadBlueColorScheme.dark()),
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
