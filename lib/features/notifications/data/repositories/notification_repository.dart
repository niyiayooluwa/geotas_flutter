import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:geotas/core/errors/failure_mapper.dart';
import 'package:geotas/core/errors/failures.dart';
import 'package:geotas/core/network/dio_client.dart';
import 'package:geotas/features/notifications/data/models/notification_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_repository.g.dart';

class NotificationRepository {
  final Dio _dio;

  NotificationRepository(this._dio);

  Future<Either<Failure, List<NotificationModel>>> getNotifications({
    String? since,
  }) async {
    try {
      final queryParams = since != null ? {'since': since} : null;
      final response = await _dio.get('/notifications', queryParameters: queryParams);
      final data = (response.data ?? []) as List<dynamic>;
      return Either.right(
        data
            .map(
              (json) => NotificationModel.fromJson(json as Map<String, dynamic>),
            )
            .toList(),
      );
    } on DioException catch (e) {
      return Either.left(mapDioException(e));
    } catch (e) {
      return Either.left(mapException(e));
    }
  }

  Future<Either<Failure, void>> markAsSeen(String notificationId) async {
    try {
      await _dio.post('/notifications/$notificationId/seen');
      return Either.right(null);
    } on DioException catch (e) {
      return Either.left(mapDioException(e));
    } catch (e) {
      return Either.left(mapException(e));
    }
  }
}

@Riverpod(keepAlive: true)
NotificationRepository notificationRepository(Ref ref) {
  return NotificationRepository(ref.watch(dioProvider));
}
