// The new unified main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:geotas/core/providers/theme_provider.dart';
import 'package:geotas/core/router/router.dart';
import 'package:geotas/firebase_options.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
    //final themeMode = ref.watch(themeModeProvider);

    return ShadApp.router(
      title: 'GEOTAS',
      theme: ShadThemeData(colorScheme: const ShadVioletColorScheme.light()),
      //darkTheme: ShadThemeData(colorScheme: const ShadGrayColorScheme.dark()),
      //themeMode: themeMode,
      routerConfig: router,
    );
  }
}
