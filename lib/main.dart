import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geotas/core/router/router.dart';
import 'package:geotas/firebase_options.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
      themeMode: ThemeMode.system,
      theme: ShadThemeData(colorScheme: const ShadNeutralColorScheme.light()),
      darkTheme: ShadThemeData(colorScheme: const ShadStoneColorScheme.dark()),
      routerConfig: router,
    );
  }
}
