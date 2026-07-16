import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_responses.freezed.dart';
part 'course_responses.g.dart';

@freezed
abstract class JoinCourseResponse with _$JoinCourseResponse {
  const factory JoinCourseResponse({
    required String id,
    @JsonKey(name: 'course_id') required String courseId,
    @JsonKey(name: 'user_id') required String userId,
    required String role,
    @JsonKey(name: 'matriculation_number') required String matriculationNumber,
    @JsonKey(name: 'joined_at') required String joinedAt,
  }) = _JoinCourseResponse;

  factory JoinCourseResponse.fromJson(Map<String, dynamic> json) =>
      _$JoinCourseResponseFromJson(json);
}

@freezed
abstract class CourseModel with _$CourseModel {
  const factory CourseModel({
    required String id,
    @JsonKey(name: 'owner_id') required String ownerId,
    required String title,
    required String code,
    @JsonKey(name: 'invite_code') required String inviteCode,
    required String department,
    @JsonKey(name: 'student_count') @Default(0) int studentCount,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'confidence_threshold') @Default(0.75) double confidenceThreshold,
  }) = _CourseModel;

  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);
}

@freezed
abstract class EnrolledCourse with _$EnrolledCourse {
  const factory EnrolledCourse({
    required String id,
    @JsonKey(name: 'owner_id') required String ownerId,
    required String title,
    required String code,
    required String department,
    @JsonKey(name: 'invite_code') required String inviteCode,
    @JsonKey(name: 'created_at') required String createdAt,
    required String role,
    @JsonKey(name: 'matriculation_number') String? matriculationNumber,
    @JsonKey(name: 'student_count') @Default(0) int studentCount,
    @JsonKey(name: 'confidence_threshold') @Default(0.75) double confidenceThreshold,
  }) = _EnrolledCourse;

  factory EnrolledCourse.fromJson(Map<String, dynamic> json) =>
      _$EnrolledCourseFromJson(json);
}

@freezed
abstract class CourseMemberModel with _$CourseMemberModel {
  const factory CourseMemberModel({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String email,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    required String role,
    @JsonKey(name: 'matriculation_number') String? matriculationNumber,
    @JsonKey(name: 'co_lecturer') required bool coLecturer,
    @JsonKey(name: 'joined_at') required String joinedAt,
  }) = _CourseMemberModel;

  factory CourseMemberModel.fromJson(Map<String, dynamic> json) =>
      _$CourseMemberModelFromJson(json);
}

@freezed
abstract class ScheduleModel with _$ScheduleModel {
  const factory ScheduleModel({
    required String id,
    @JsonKey(name: 'course_id') required String courseId,
    @JsonKey(name: 'day_of_week') required int dayOfWeek,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    required String venue,
  }) = _ScheduleModel;

  factory ScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleModelFromJson(json);
}