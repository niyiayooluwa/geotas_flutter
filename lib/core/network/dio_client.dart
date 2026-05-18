import 'package:dio/dio.dart';
import 'package:geotas/core/constants/api_constants.dart';
import 'package:geotas/core/network/interceptors/auth_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_client.g.dart';

// keepAlive: true — Dio must never be disposed while requests are in flight.
// Without this, autoDispose tears down the provider (and its Ref) between
// navigations, causing "Ref used after disposal" errors in the interceptor.
@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: ApiConstants.connectTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
      headers: {'Content-Type': 'application/json'},
    ),
  );

  dio.interceptors.add(AuthInterceptor());

  return dio;
}