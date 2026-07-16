import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart'; // <-- Added this

class PermissionService {
  /// Requests location permission. Returns true if granted.
  /// Requests location permission and enforces PRECISE accuracy.
  /// Returns true if granted and precise.
  static Future<bool> requestLocation() async {
    // 1. Check if the physical GPS is turned on
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Automatically open the phone's GPS toggle settings
      await Geolocator.openLocationSettings();
      return false;
    }

    // 2. Request base location permissions
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      // They clicked "Don't ask again", force them to settings
      await openAppSettings(); // from permission_handler
      return false;
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      // 3. ENFORCE PRECISE LOCATION (Crucial for geofencing)
      final accuracy = await Geolocator.getLocationAccuracy();

      if (accuracy == LocationAccuracyStatus.reduced) {
        // They gave us "Approximate" location. We cannot do geofencing with this.
        // The OS doesn't let us re-prompt for Precise easily, so we route them to settings.
        await openAppSettings();
        return false;
      }

      return true; // We have permission, AND it is precise!
    }

    return false;
  }

  /// Requests camera permission explicitly via permission_handler. Returns true if granted.
  static Future<bool> requestCamera() async {
    // 1. Check current status
    var status = await Permission.camera.status;

    if (status.isGranted) {
      return true;
    }

    // 2. If denied forever (user clicked "Don't ask again"), open app settings
    if (status.isPermanentlyDenied) {
      await openAppSettings();
      return false; // Return false so they have to come back and click "Retry" after changing settings
    }

    // 3. Otherwise, explicitly request the permission and show the OS dialog
    status = await Permission.camera.request();
    return status.isGranted;
  }
}
