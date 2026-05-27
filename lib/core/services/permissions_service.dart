import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class PermissionService {
  /// Requests location permission. Returns true if granted.
  static Future<bool> requestLocation() async {
    if (kIsWeb) {
      // On web, geolocator triggers the browser prompt automatically
      final permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        final requested = await Geolocator.requestPermission();
        return requested == LocationPermission.whileInUse ||
            requested == LocationPermission.always;
      }
      return permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always;
    }

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return false;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) return false;

    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  /// Requests camera permission via mobile_scanner. Returns true if granted.
  static Future<bool> requestCamera() async {
    if (kIsWeb) return true;
    final controller = MobileScannerController();
    try {
      await controller.start();
      await controller.stop();
      await controller.dispose();
      return true;
    } catch (_) {
      await controller.dispose();
      return false;
    }
  }
}
