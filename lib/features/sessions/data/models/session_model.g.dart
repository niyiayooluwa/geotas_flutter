// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionModel _$SessionModelFromJson(Map<String, dynamic> json) =>
    _SessionModel(
      id: json['id'] as String,
      courseId: json['course_id'] as String,
      createdBy: json['created_by'] as String,
      title: json['title'] as String,
      weekNumber: (json['week_number'] as num).toInt(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      radiusMeters: (json['radius_meters'] as num).toDouble(),
      qrRotationSecs: (json['qr_rotation_secs'] as num).toInt(),
      status: json['status'] as String,
      startedAt: json['started_at'] as String,
      closedAt: json['closed_at'] as String?,
    );

Map<String, dynamic> _$SessionModelToJson(_SessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_id': instance.courseId,
      'created_by': instance.createdBy,
      'title': instance.title,
      'week_number': instance.weekNumber,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'radius_meters': instance.radiusMeters,
      'qr_rotation_secs': instance.qrRotationSecs,
      'status': instance.status,
      'started_at': instance.startedAt,
      'closed_at': instance.closedAt,
    };

_CreateSessionRequest _$CreateSessionRequestFromJson(
  Map<String, dynamic> json,
) => _CreateSessionRequest(
  courseId: json['course_id'] as String,
  title: json['title'] as String,
  weekNumber: (json['week_number'] as num).toInt(),
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  radiusMeters: (json['radius_meters'] as num).toDouble(),
  qrRotationSecs: (json['qr_rotation_secs'] as num?)?.toInt() ?? 30,
);

Map<String, dynamic> _$CreateSessionRequestToJson(
  _CreateSessionRequest instance,
) => <String, dynamic>{
  'course_id': instance.courseId,
  'title': instance.title,
  'week_number': instance.weekNumber,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'radius_meters': instance.radiusMeters,
  'qr_rotation_secs': instance.qrRotationSecs,
};

_QRTokenResponse _$QRTokenResponseFromJson(Map<String, dynamic> json) =>
    _QRTokenResponse(token: json['token'] as String);

Map<String, dynamic> _$QRTokenResponseToJson(_QRTokenResponse instance) =>
    <String, dynamic>{'token': instance.token};
