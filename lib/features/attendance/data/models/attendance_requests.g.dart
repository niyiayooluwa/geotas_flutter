// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MarkAttendanceQRRequest _$MarkAttendanceQRRequestFromJson(
  Map<String, dynamic> json,
) => _MarkAttendanceQRRequest(
  sessionId: json['session_id'] as String,
  qrToken: json['qr_token'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  deviceId: json['device_id'] as String,
  deviceModel: json['device_model'] as String,
  osVersion: json['os_version'] as String,
  mockLocationDetected: json['mock_location_detected'] as bool,
);

Map<String, dynamic> _$MarkAttendanceQRRequestToJson(
  _MarkAttendanceQRRequest instance,
) => <String, dynamic>{
  'session_id': instance.sessionId,
  'qr_token': instance.qrToken,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'device_id': instance.deviceId,
  'device_model': instance.deviceModel,
  'os_version': instance.osVersion,
  'mock_location_detected': instance.mockLocationDetected,
};

_MarkAttendanceOTPRequest _$MarkAttendanceOTPRequestFromJson(
  Map<String, dynamic> json,
) => _MarkAttendanceOTPRequest(
  sessionId: json['session_id'] as String,
  otpCode: json['otp_code'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  deviceId: json['device_id'] as String,
  deviceModel: json['device_model'] as String,
  osVersion: json['os_version'] as String,
  mockLocationDetected: json['mock_location_detected'] as bool,
);

Map<String, dynamic> _$MarkAttendanceOTPRequestToJson(
  _MarkAttendanceOTPRequest instance,
) => <String, dynamic>{
  'session_id': instance.sessionId,
  'otp_code': instance.otpCode,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'device_id': instance.deviceId,
  'device_model': instance.deviceModel,
  'os_version': instance.osVersion,
  'mock_location_detected': instance.mockLocationDetected,
};

_RequestOTPRequest _$RequestOTPRequestFromJson(Map<String, dynamic> json) =>
    _RequestOTPRequest(sessionId: json['session_id'] as String);

Map<String, dynamic> _$RequestOTPRequestToJson(_RequestOTPRequest instance) =>
    <String, dynamic>{'session_id': instance.sessionId};
