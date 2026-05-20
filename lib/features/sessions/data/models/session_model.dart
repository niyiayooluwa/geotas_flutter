import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_model.freezed.dart';
part 'session_model.g.dart';

@freezed
abstract class SessionModel with _$SessionModel {
  const factory SessionModel({
    required String id,
    @JsonKey(name: 'course_id') required String courseId,
    @JsonKey(name: 'created_by') required String createdBy,
    required String title,
    @JsonKey(name: 'week_number') required int weekNumber,
    required double latitude,
    required double longitude,
    @JsonKey(name: 'radius_meters') required double radiusMeters,
    @JsonKey(name: 'qr_rotation_secs') required int qrRotationSecs,
    required String status,
    @JsonKey(name: 'started_at') required String startedAt,
    @JsonKey(name: 'closed_at') String? closedAt,
  }) = _SessionModel;

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);
}

@freezed
abstract class CreateSessionRequest with _$CreateSessionRequest {
  const factory CreateSessionRequest({
    @JsonKey(name: 'course_id') required String courseId,
    required String title,
    @JsonKey(name: 'week_number') required int weekNumber,
    required double latitude,
    required double longitude,
    @JsonKey(name: 'radius_meters') required double radiusMeters,
    @JsonKey(name: 'qr_rotation_secs', defaultValue: 30) int? qrRotationSecs,
  }) = _CreateSessionRequest;

  factory CreateSessionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateSessionRequestFromJson(json);
}

@freezed
abstract class QRTokenResponse with _$QRTokenResponse {
  const factory QRTokenResponse({required String token}) = _QRTokenResponse;

  factory QRTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$QRTokenResponseFromJson(json);
}