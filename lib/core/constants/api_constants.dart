import 'package:flutter/foundation.dart';

class ApiConstants {
  static String get baseUrl {
    if (kIsWeb) return 'http://localhost:8080';
    // 10.0.2.2 is the special alias to your host loopback interface on Android emulators
    if (defaultTargetPlatform == TargetPlatform.android) {
      return 'https://commons-retrieval-occurrence-confident.trycloudflare.com';
    }
    // iOS Simulator, Web, or Physical device (requires local IP instead of localhost)
    return 'http://localhost:8080';
  }

  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 10);
}
