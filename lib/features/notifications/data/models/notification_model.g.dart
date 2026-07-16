// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    _NotificationModel(
      id: json['id'] as String,
      courseId: json['course_id'] as String,
      type: json['type'] as String,
      payload: json['payload'] as Map<String, dynamic>,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$NotificationModelToJson(_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_id': instance.courseId,
      'type': instance.type,
      'payload': instance.payload,
      'created_at': instance.createdAt,
    };
