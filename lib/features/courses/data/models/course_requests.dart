import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_requests.freezed.dart';
part 'course_requests.g.dart';

@freezed
abstract class CreateCourseRequest with _$CreateCourseRequest {
  const factory CreateCourseRequest({
    required String title,
    required String code,
    required String department,
  }) = _CreateCourseRequest;

  factory CreateCourseRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCourseRequestFromJson(json);
}

@freezed
abstract class JoinCourseRequest with _$JoinCourseRequest {
  const factory JoinCourseRequest({
    @JsonKey(name: 'invite_code') required String inviteCode,
    @JsonKey(name: 'matriculation_number') required String matriculationNumber,
  }) = _JoinCourseRequest;

  factory JoinCourseRequest.fromJson(Map<String, dynamic> json) =>
      _$JoinCourseRequestFromJson(json);
}