import 'package:dio/dio.dart';
import 'package:geotas/core/constants/api_constants.dart';
import 'package:geotas/core/network/interceptors/auth_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_client.g.dart';

@riverpod
Dio dio(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: ApiConstants.connectTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
      headers: {'Content-Type': 'application/json'},
    ),
  );

  dio.interceptors.add(AuthInterceptor(ref));

  return dio;
}
