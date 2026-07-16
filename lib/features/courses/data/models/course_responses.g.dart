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
      matriculationNumber: json['matriculation_number'] as String,
      joinedAt: json['joined_at'] as String,
    );

Map<String, dynamic> _$JoinCourseResponseToJson(_JoinCourseResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_id': instance.courseId,
      'user_id': instance.userId,
      'role': instance.role,
      'matriculation_number': instance.matriculationNumber,
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

_CourseMemberModel _$CourseMemberModelFromJson(Map<String, dynamic> json) =>
    _CourseMemberModel(
      userId: json['user_id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatar_url'] as String?,
      role: json['role'] as String,
      matriculationNumber: json['matriculation_number'] as String?,
      coLecturer: json['co_lecturer'] as bool,
      joinedAt: json['joined_at'] as String,
    );

Map<String, dynamic> _$CourseMemberModelToJson(_CourseMemberModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'avatar_url': instance.avatarUrl,
      'role': instance.role,
      'matriculation_number': instance.matriculationNumber,
      'co_lecturer': instance.coLecturer,
      'joined_at': instance.joinedAt,
    };

_ScheduleModel _$ScheduleModelFromJson(Map<String, dynamic> json) =>
    _ScheduleModel(
      id: json['id'] as String,
      courseId: json['course_id'] as String,
      dayOfWeek: (json['day_of_week'] as num).toInt(),
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      venue: json['venue'] as String,
    );

Map<String, dynamic> _$ScheduleModelToJson(_ScheduleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_id': instance.courseId,
      'day_of_week': instance.dayOfWeek,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'venue': instance.venue,
    };
