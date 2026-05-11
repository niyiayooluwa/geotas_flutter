import 'package:dio/dio.dart';
import 'package:geotas/core/storage/secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthInterceptor extends Interceptor {
  final Ref _ref;

  AuthInterceptor(this._ref);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Access the storage through the provider
    final storage = _ref.read(secureStorageProvider);
    final token = await storage.getToken();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);

    @override
    // ignore: unused_element
    void onError(DioException err, ErrorInterceptorHandler handler) {
      if (err.response?.statusCode == 401) {
        // TODO: Trigger logout and navigation via Ref
      }
      handler.next(err);
    }
  }
}
