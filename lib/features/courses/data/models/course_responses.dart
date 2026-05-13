import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_responses.freezed.dart';
part 'course_responses.g.dart';

@freezed
abstract class CourseModel with _$CourseModel {
  const factory CourseModel({
    required String id,
    @JsonKey(name: 'owner_id') required String ownerId,
    required String title,
    required String code,
    @JsonKey(name: 'invite_code') required String inviteCode,
    required String department,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _CourseModel;

  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);
}

@freezed
abstract class JoinCourseResponse with _$JoinCourseResponse {
  const factory JoinCourseResponse({
    required String id,
    @JsonKey(name: 'course_id') required String courseId,
    @JsonKey(name: 'user_id') required String userId,
    required String role,
    @JsonKey(name: 'joined_at') required DateTime joinedAt,
  }) = _JoinCourseResponse;

  factory JoinCourseResponse.fromJson(Map<String, dynamic> json) =>
      _$JoinCourseResponseFromJson(json);
}

@freezed
abstract class EnrolledCourse with _$EnrolledCourse {
  const factory EnrolledCourse({
    required String id,
    @JsonKey(name: 'owner_id') required String ownerId,
    required String title,
    required String code,
    required String department,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    required String role,
    @JsonKey(name: 'matriculation_number') required String matriculationNumber,
  }) = _EnrolledCourse;

  factory EnrolledCourse.fromJson(Map<String, dynamic> json) =>
      _$EnrolledCourseFromJson(json);
}