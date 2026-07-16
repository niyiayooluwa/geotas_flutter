import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:geolocator/geolocator.dart';

class DeviceInfoHelper {
  static Future<Map<String, dynamic>> getCollectionData() async {
    final deviceInfo = DeviceInfoPlugin();
    String deviceId = 'unknown';
    String deviceModel = 'unknown';
    String osVersion = 'unknown';
    bool mockLocationDetected = false;

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id;
      deviceModel = androidInfo.model;
      osVersion = androidInfo.version.release;
      mockLocationDetected = !androidInfo.isPhysicalDevice;
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor ?? 'unknown';
      deviceModel = iosInfo.model;
      osVersion = iosInfo.systemVersion;
      mockLocationDetected = !iosInfo.isPhysicalDevice;
    }

    // Get Location
    final position = await Geolocator.getCurrentPosition();

    return {
      'deviceId': deviceId,
      'deviceModel': deviceModel,
      'osVersion': osVersion,
      'mockLocationDetected': mockLocationDetected || position.isMocked,
      'latitude': position.latitude,
      'longitude': position.longitude,
    };
  }
}
