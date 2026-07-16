import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_requests.freezed.dart';
part 'attendance_requests.g.dart';

@freezed
abstract class MarkAttendanceQRRequest with _$MarkAttendanceQRRequest {
  const factory MarkAttendanceQRRequest({
    @JsonKey(name: 'session_id') required String sessionId,
    @JsonKey(name: 'qr_token') required String qrToken,
    required double latitude,
    required double longitude,
    @JsonKey(name: 'device_id') required String deviceId,
    @JsonKey(name: 'device_model') required String deviceModel,
    @JsonKey(name: 'os_version') required String osVersion,
    @JsonKey(name: 'mock_location_detected') required bool mockLocationDetected,
  }) = _MarkAttendanceQRRequest;

  factory MarkAttendanceQRRequest.fromJson(Map<String, dynamic> json) =>
      _$MarkAttendanceQRRequestFromJson(json);
}

@freezed
abstract class MarkAttendanceOTPRequest with _$MarkAttendanceOTPRequest {
  const factory MarkAttendanceOTPRequest({
    @JsonKey(name: 'session_id') required String sessionId,
    @JsonKey(name: 'otp_code') required String otpCode,
    required double latitude,
    required double longitude,
    @JsonKey(name: 'device_id') required String deviceId,
    @JsonKey(name: 'device_model') required String deviceModel,
    @JsonKey(name: 'os_version') required String osVersion,
    @JsonKey(name: 'mock_location_detected') required bool mockLocationDetected,
  }) = _MarkAttendanceOTPRequest;

  factory MarkAttendanceOTPRequest.fromJson(Map<String, dynamic> json) =>
      _$MarkAttendanceOTPRequestFromJson(json);
}
