import 'package:dio/dio.dart';
import 'package:geotas/core/storage/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  // Instantiate directly — no Ref needed, SecureStorage has no dependencies.
  final _storage = SecureStorage();

  static const _bypassEndpoints = ['/auth/login', '/auth/register', '/health'];

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_bypassEndpoints.contains(options.path)) {
      return handler.next(options);
    }

    final token = await _storage.getToken();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      _storage.deleteToken();
      // Navigation will be handled by the caller using the error response
    }
    handler.next(err);
  }
}
