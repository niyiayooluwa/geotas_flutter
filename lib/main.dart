// The new unified main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:geotas/core/router/router.dart';
import 'package:geotas/firebase_options.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

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

    // Remove splash screen once the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });

    return ShadApp.router(
      title: 'GEOTAS',
      theme: ShadThemeData(colorScheme: const ShadVioletColorScheme.light()),
      routerConfig: router,
    );
  }
}
