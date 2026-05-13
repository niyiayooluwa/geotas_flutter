// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => _CourseModel(
  id: json['id'] as String,
  ownerId: json['owner_id'] as String,
  title: json['title'] as String,
  code: json['code'] as String,
  inviteCode: json['invite_code'] as String,
  department: json['department'] as String,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$CourseModelToJson(_CourseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'title': instance.title,
      'code': instance.code,
      'invite_code': instance.inviteCode,
      'department': instance.department,
      'created_at': instance.createdAt,
    };

_JoinCourseResponse _$JoinCourseResponseFromJson(Map<String, dynamic> json) =>
    _JoinCourseResponse(
      id: json['id'] as String,
      courseId: json['course_id'] as String,
      userId: json['user_id'] as String,
      role: json['role'] as String,
      joinedAt: json['joined_at'] as String,
    );

Map<String, dynamic> _$JoinCourseResponseToJson(_JoinCourseResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_id': instance.courseId,
      'user_id': instance.userId,
      'role': instance.role,
      'joined_at': instance.joinedAt,
    };

_EnrolledCourse _$EnrolledCourseFromJson(Map<String, dynamic> json) =>
    _EnrolledCourse(
      id: json['id'] as String,
      ownerId: json['owner_id'] as String,
      title: json['title'] as String,
      code: json['code'] as String,
      department: json['department'] as String,
      createdAt: json['created_at'] as String,
      role: json['role'] as String,
      matriculationNumber: json['matriculation_number'] as String?,
    );

Map<String, dynamic> _$EnrolledCourseToJson(_EnrolledCourse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'title': instance.title,
      'code': instance.code,
      'department': instance.department,
      'created_at': instance.createdAt,
      'role': instance.role,
      'matriculation_number': instance.matriculationNumber,
    };
