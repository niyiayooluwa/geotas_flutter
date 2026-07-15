// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

_CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => _CourseModel(
  id: json['id'] as String,
  ownerId: json['owner_id'] as String,
  title: json['title'] as String,
  code: json['code'] as String,
  inviteCode: json['invite_code'] as String,
  department: json['department'] as String,
  studentCount: (json['student_count'] as num?)?.toInt() ?? 0,
  createdAt: json['created_at'] as String,
  confidenceThreshold:
      (json['confidence_threshold'] as num?)?.toDouble() ?? 0.75,
);

Map<String, dynamic> _$CourseModelToJson(_CourseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'title': instance.title,
      'code': instance.code,
      'invite_code': instance.inviteCode,
      'department': instance.department,
      'student_count': instance.studentCount,
      'created_at': instance.createdAt,
      'confidence_threshold': instance.confidenceThreshold,
    };

_EnrolledCourse _$EnrolledCourseFromJson(Map<String, dynamic> json) =>
    _EnrolledCourse(
      id: json['id'] as String,
      ownerId: json['owner_id'] as String,
      title: json['title'] as String,
      code: json['code'] as String,
      department: json['department'] as String,
      inviteCode: json['invite_code'] as String,
      createdAt: json['created_at'] as String,
      role: json['role'] as String,
      matriculationNumber: json['matriculation_number'] as String?,
      studentCount: (json['student_count'] as num?)?.toInt() ?? 0,
      confidenceThreshold:
          (json['confidence_threshold'] as num?)?.toDouble() ?? 0.75,
    );

Map<String, dynamic> _$EnrolledCourseToJson(_EnrolledCourse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'title': instance.title,
      'code': instance.code,
      'department': instance.department,
      'invite_code': instance.inviteCode,
      'created_at': instance.createdAt,
      'role': instance.role,
      'matriculation_number': instance.matriculationNumber,
      'student_count': instance.studentCount,
      'confidence_threshold': instance.confidenceThreshold,
    };
