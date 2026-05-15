import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:geotas/core/errors/failures.dart';
import 'package:geotas/core/network/dio_client.dart';
import 'package:geotas/features/auth/data/models/auth_request.dart';
import 'package:geotas/features/auth/data/models/auth_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final Dio _dio;

  AuthRepository(this._dio);

  Future<Either<Failure, LoginResponse>> login(LoginRequest request) async {
    try {
      final response = await _dio.post('/auth/login', data: request.toJson());
      return Either.right(LoginResponse.fromJson(response.data));
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = data is Map
          ? data['message']?.toString()
          : data?.toString();
      return Either.left(ServerFailure(message ?? 'Something went wrong'));
    } catch (e) {
      return Either.left(OtherFailure(e.toString()));
    }
  }

  Future<Either<Failure, RegisterResponse>> register(
    RegisterRequest request,
  ) async {
    try {
      final response = await _dio.post(
        '/auth/register',
        data: request.toJson(),
      );
      return Either.right(RegisterResponse.fromJson(response.data));
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = data is Map
          ? data['message']?.toString()
          : data?.toString();
      return Either.left(ServerFailure(message ?? 'Something went wrong'));
    } catch (e) {
      return Either.left(OtherFailure(e.toString()));
    }
  }
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository(ref.watch(dioProvider));
}