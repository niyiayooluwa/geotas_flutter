import 'package:dio/dio.dart';
import 'package:geotas/core/errors/failures.dart';
import 'package:geotas/core/network/dio_client.dart';
import 'package:geotas/core/storage/secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lecturer_auth_provider.g.dart';

@riverpod
class LecturerAuth extends _$LecturerAuth {
  @override
  FutureOr<void> build() {}

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final dio = ref.read(dioProvider);
      final response = await dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );

      final token = response.data['token'] as String;

      final storage = SecureStorage();
      await storage.saveToken(token);
      await storage.saveRole('lecturer');

      state = const AsyncValue.data(null);
    } on DioException catch (e) {
      final msg = e.response?.data?.toString() ?? 'Login failed';
      state = AsyncValue.error(ServerFailure(msg), StackTrace.current);
    } catch (e, st) {
      state = AsyncValue.error(ServerFailure(e.toString()), st);
    }
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    try {
      final dio = ref.read(dioProvider);
      await dio.post(
        '/auth/register',
        data: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'password': password,
        },
      );
      // Automatically log in after registration
      await login(email, password);
    } on DioException catch (e) {
      final msg = e.response?.data?.toString() ?? 'Registration failed';
      state = AsyncValue.error(ServerFailure(msg), StackTrace.current);
    } catch (e, st) {
      state = AsyncValue.error(ServerFailure(e.toString()), st);
    }
  }
}
