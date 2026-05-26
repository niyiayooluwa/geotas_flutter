import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geotas/core/errors/failures.dart';

/// Extracts the plain-text error body from a DioException.
/// The Go backend uses http.Error() which sends plain text, not JSON.
String _extractMessage(DioException e) {
  final data = e.response?.data;
  if (data is String) return data.trim().toLowerCase();
  if (data is Map) {
    return (data['error'] ?? data['message'] ?? '').toString().trim().toLowerCase();
  }
  return '';
}

bool _isNetworkError(DioException e) {
  return e.type == DioExceptionType.connectionError ||
      e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.receiveTimeout ||
      e.type == DioExceptionType.sendTimeout;
}

/// Maps a DioException to the correct Failure type based on
/// the backend error message and HTTP status code.
Failure mapDioException(DioException e) {
  if (_isNetworkError(e)) return const NetworkFailure();

  final message = _extractMessage(e); // already lowercased
  final status = e.response?.statusCode;

  // message is checked first — always more specific than status code
  // auth
  if (message.contains('invalid credentials')) return const InvalidCredentialsFailure();

  // attendance
  if (message.contains('mock location')) return const MockLocationFailure();
  if (message.contains('already marked') || message.contains('already been marked')) return const AlreadyMarkedFailure();
  if (message.contains('not enrolled') || message.contains('not a member')) return const NotEnrolledFailure();
  if (message.contains('session is not active') || message.contains('not active') || message.contains('already closed')) return const SessionClosedFailure();
  if (message.contains('invalid or expired qr') || message.contains('qr token')) return const InvalidQRFailure();
  if (message.contains('invalid or expired otp') || message.contains('otp')) return const InvalidOTPFailure();

  // courses
  if (message.contains('invalid invite code')) return const InvalidInviteCodeFailure();
  if (message.contains('already a member')) return const AlreadyMemberFailure();
  if (message.contains('already exists') || message.contains('already registered')) return const DuplicateFailure();

  // status code is the last resort fallback
  if (status == 401) return const UnauthorizedFailure();

  return const ServerFailure();
}

/// Maps a generic dart exception to OtherFailure.
Failure mapException(Object e) {
  debugPrint('mapException caught: $e');
  return const OtherFailure();
}