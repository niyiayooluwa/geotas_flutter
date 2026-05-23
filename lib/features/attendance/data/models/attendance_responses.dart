import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_responses.freezed.dart';
part 'attendance_responses.g.dart';

@freezed
abstract class AttendanceResponse with _$AttendanceResponse {
  const factory AttendanceResponse({
    required String id,
    @JsonKey(name: 'session_id') required String sessionId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'marked_at') required String markedAt,
    required String method,
    @JsonKey(name: 'week_number') required int weekNumber,
    @JsonKey(name: 'confidence_score') @Default(0.0) double confidenceScore, // add this line
  }) = _AttendanceResponse;

  factory AttendanceResponse.fromJson(Map<String, dynamic> json) =>
      _$AttendanceResponseFromJson(json);
}

@freezed
abstract class DetailedAttendanceModel with _$DetailedAttendanceModel {
  const factory DetailedAttendanceModel({
    required String id,
    @JsonKey(name: 'session_id') required String sessionId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'marked_at') required String markedAt,
    required String method,
    required double latitude,
    required double longitude,
    @JsonKey(name: 'distance_from_center') required double distanceFromCenter,
    @JsonKey(name: 'mock_location_detected') required bool mockLocationDetected,
    @JsonKey(name: 'confidence_score') required double confidenceScore,
    @JsonKey(name: 'week_number') required int weekNumber,
    @JsonKey(name: 'device_id') required String deviceId,
    @JsonKey(name: 'device_model') required String deviceModel,
    @JsonKey(name: 'os_version') required String osVersion,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'matriculation_number') required String matriculationNumber,
    required String department,
  }) = _DetailedAttendanceModel;

  factory DetailedAttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$DetailedAttendanceModelFromJson(json);
}

@freezed
abstract class OTPResponse with _$OTPResponse {
  const factory OTPResponse({
    @JsonKey(name: 'otp_code') required String otpCode,
    @JsonKey(name: 'expires_at') required String expiresAt,
  }) = _OTPResponse;

  factory OTPResponse.fromJson(Map<String, dynamic> json) =>
      _$OTPResponseFromJson(json);
}