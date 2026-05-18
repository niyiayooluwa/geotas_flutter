// The new unified main.dart
import 'package:flutter/material.dart';
import 'package:geotas/core/router/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();

  runApp(
    UncontrolledProviderScope(container: container, child: const GeotasApp()),
  );
}

class GeotasApp extends ConsumerWidget {
  const GeotasApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return ShadApp.router(
      title: 'GEOTAS',
      theme: ShadThemeData(colorScheme: const ShadGrayColorScheme.light()),
      darkTheme: ShadThemeData(colorScheme: const ShadGrayColorScheme.dark()),
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
