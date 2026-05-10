import 'package:dio/dio.dart';
import 'package:geotas/core/network/interceptors/auth_interceptor.dart';

Dio createDioClient() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:8080',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  dio.interceptors.add(AuthInterceptor());

  return dio;
}
