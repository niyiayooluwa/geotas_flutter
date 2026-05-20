import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:geotas/core/errors/failures.dart';
import 'package:geotas/core/network/dio_client.dart';
import 'package:geotas/features/attendance/data/models/attendance_requests.dart';
import 'package:geotas/features/attendance/data/models/attendance_responses.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attendance_repository.g.dart';

class AttendanceRepository {
  final Dio _dio;

  AttendanceRepository(this._dio);

  Future<Either<Failure, AttendanceResponse>> markWithQR(
    MarkAttendanceQRRequest request,
  ) async {
    try {
      final response = await _dio.post('/attendance/qr', data: request.toJson());
      return Either.right(AttendanceResponse.fromJson(response.data));
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = data is Map
          ? data['message']?.toString()
          : data?.toString();
      return Either.left(
        ServerFailure(message ?? 'An error occurred connecting to the server'),
      );
    } catch (e) {
      return Either.left(OtherFailure('Failed to mark attendance: $e'));
    }
  }

  Future<Either<Failure, OTPResponse>> requestOTP(String sessionId) async {
    try {
      final response = await _dio.post(
        '/attendance/otp/request',
        data: {'session_id': sessionId},
      );
      return Either.right(OTPResponse.fromJson(response.data));
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = data is Map
          ? data['message']?.toString()
          : data?.toString();
      return Either.left(
        ServerFailure(message ?? 'An error occurred connecting to the server'),
      );
    } catch (e) {
      return Either.left(OtherFailure('Failed to request OTP: $e'));
    }
  }

  Future<Either<Failure, AttendanceResponse>> verifyOTP(
    MarkAttendanceOTPRequest request,
  ) async {
    try {
      final response = await _dio.post(
        '/attendance/otp/verify',
        data: request.toJson(),
      );
      return Either.right(AttendanceResponse.fromJson(response.data));
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = data is Map
          ? data['message']?.toString()
          : data?.toString();
      return Either.left(
        ServerFailure(message ?? 'An error occurred connecting to the server'),
      );
    } catch (e) {
      return Either.left(OtherFailure('Failed to verify OTP: $e'));
    }
  }

  Future<Either<Failure, List<DetailedAttendanceModel>>> getSessionAttendance(
    String sessionId,
  ) async {
    try {
      final response = await _dio.get('/sessions/$sessionId/attendance');
      final data = (response.data ?? []) as List<dynamic>;
      final attendance = data
          .map(
            (json) =>
                DetailedAttendanceModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();
      return Either.right(attendance);
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = data is Map
          ? data['message']?.toString()
          : data?.toString();
      return Either.left(
        ServerFailure(message ?? 'An error occurred connecting to the server'),
      );
    } catch (e) {
      return Either.left(OtherFailure('Failed to process attendance data: $e'));
    }
  }
}

@Riverpod(keepAlive: true)
AttendanceRepository attendanceRepository(Ref ref) {
  return AttendanceRepository(ref.watch(dioProvider));
}
