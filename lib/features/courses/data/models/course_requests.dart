import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_requests.freezed.dart';

@freezed
abstract class CreateCourseRequest with _$CreateCourseRequest {
  const factory CreateCourseRequest({
    required String title,
    required String code,
    required String department,
  }) = _CreateCourseRequest;
}

@freezed
abstract class JoinCourseRequest with _$JoinCourseRequest {
  const factory JoinCourseRequest({
    @JsonKey(name: 'invite_code') required String inviteCode,
    @JsonKey(name: 'matriculation_number') required String matriculationNumber,
  }) = _JoinCourseRequest;
}