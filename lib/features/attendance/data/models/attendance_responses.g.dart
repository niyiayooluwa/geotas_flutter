// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttendanceResponse _$AttendanceResponseFromJson(Map<String, dynamic> json) =>
    _AttendanceResponse(
      id: json['id'] as String,
      sessionId: json['session_id'] as String,
      userId: json['user_id'] as String,
      markedAt: json['marked_at'] as String,
      method: json['method'] as String,
      weekNumber: (json['week_number'] as num).toInt(),
      confidenceScore: (json['confidence_score'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$AttendanceResponseToJson(_AttendanceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'session_id': instance.sessionId,
      'user_id': instance.userId,
      'marked_at': instance.markedAt,
      'method': instance.method,
      'week_number': instance.weekNumber,
      'confidence_score': instance.confidenceScore,
    };

_DetailedAttendanceModel _$DetailedAttendanceModelFromJson(
  Map<String, dynamic> json,
) => _DetailedAttendanceModel(
  id: json['id'] as String,
  sessionId: json['session_id'] as String,
  userId: json['user_id'] as String,
  markedAt: json['marked_at'] as String,
  method: json['method'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  distanceFromCenter: (json['distance_from_center'] as num).toDouble(),
  mockLocationDetected: json['mock_location_detected'] as bool,
  confidenceScore: (json['confidence_score'] as num).toDouble(),
  weekNumber: (json['week_number'] as num).toInt(),
  deviceId: json['device_id'] as String,
  deviceModel: json['device_model'] as String,
  osVersion: json['os_version'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  matriculationNumber: json['matriculation_number'] as String,
  department: json['department'] as String?,
);

Map<String, dynamic> _$DetailedAttendanceModelToJson(
  _DetailedAttendanceModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'session_id': instance.sessionId,
  'user_id': instance.userId,
  'marked_at': instance.markedAt,
  'method': instance.method,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'distance_from_center': instance.distanceFromCenter,
  'mock_location_detected': instance.mockLocationDetected,
  'confidence_score': instance.confidenceScore,
  'week_number': instance.weekNumber,
  'device_id': instance.deviceId,
  'device_model': instance.deviceModel,
  'os_version': instance.osVersion,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'matriculation_number': instance.matriculationNumber,
  'department': instance.department,
};

_OTPResponse _$OTPResponseFromJson(Map<String, dynamic> json) => _OTPResponse(
  otpCode: json['otp_code'] as String,
  expiresAt: json['expires_at'] as String,
);

Map<String, dynamic> _$OTPResponseToJson(_OTPResponse instance) =>
    <String, dynamic>{
      'otp_code': instance.otpCode,
      'expires_at': instance.expiresAt,
    };
