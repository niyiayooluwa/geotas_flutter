import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:geotas/core/errors/failure_mapper.dart';
import 'package:geotas/core/errors/failures.dart';
import 'package:geotas/core/network/dio_client.dart';
import 'package:geotas/features/sessions/data/models/session_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_repository.g.dart';

class SessionRepository {
  final Dio _dio;

  SessionRepository(this._dio);

  Future<Either<Failure, SessionModel>> createSession(
    CreateSessionRequest request,
  ) async {
    try {
      final response = await _dio.post('/sessions', data: request.toJson());
      return Either.right(SessionModel.fromJson(response.data));
    } on DioException catch (e) {
      return Either.left(mapDioException(e));
    } catch (e) {
      return Either.left(mapException(e));
    }
  }

  Future<Either<Failure, List<SessionModel>>> getCourseSessions(
    String courseId,
  ) async {
    try {
      final response = await _dio.get('/courses/$courseId/sessions');
      final data = (response.data ?? []) as List<dynamic>;
      return Either.right(
        data
            .map((json) => SessionModel.fromJson(json as Map<String, dynamic>))
            .toList(),
      );
    } on DioException catch (e) {
      return Either.left(mapDioException(e));
    } catch (e) {
      return Either.left(mapException(e));
    }
  }

  Future<Either<Failure, SessionModel>> closeSession(String sessionId) async {
    try {
      final response = await _dio.patch('/sessions/$sessionId/close');
      return Either.right(SessionModel.fromJson(response.data));
    } on DioException catch (e) {
      return Either.left(mapDioException(e));
    } catch (e) {
      return Either.left(mapException(e));
    }
  }

  Future<Either<Failure, QRTokenResponse>> getQRToken(String sessionId) async {
    try {
      final response = await _dio.get('/sessions/$sessionId/qr-token');
      return Either.right(QRTokenResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Either.left(mapDioException(e));
    } catch (e) {
      return Either.left(mapException(e));
    }
  }

  Future<Either<Failure, void>> deleteSession(String sessionId) async {
    try {
      await _dio.delete('/sessions/$sessionId');
      return Either.right(null);
    } on DioException catch (e) {
      return Either.left(mapDioException(e));
    } catch (e) {
      return Either.left(mapException(e));
    }
  }
}

@Riverpod(keepAlive: true)
SessionRepository sessionRepository(Ref ref) {
  return SessionRepository(ref.watch(dioProvider));
}
