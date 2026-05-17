import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:geotas/core/errors/failures.dart';
import 'package:geotas/core/network/dio_client.dart';
import 'package:geotas/features/courses/data/models/course_requests.dart';
import 'package:geotas/features/courses/data/models/course_responses.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'course_repository.g.dart';

// Removed @riverpod from here so it's a normal class
class CourseRepository {
  final Dio _dio;

  CourseRepository(this._dio);

  Future<Either<Failure, List<CourseModel>>> getOwnedCourses() async {
    try {
      final response = await _dio.get('/courses');
      final data = response.data as List<dynamic>;

      final courses = data
          .map((json) => CourseModel.fromJson(json as Map<String, dynamic>))
          .toList();

      return Either.right(courses);
    } on DioException catch (e) {
      return Either.left(
        ServerFailure(
          e.message ?? 'An error occurred connecting to the server',
        ),
      );
    } catch (e) {
      return Either.left(OtherFailure('Failed to process course data: $e'));
    }
  }

  Future<Either<Failure, CourseModel>> createCourse(
    CreateCourseRequest request,
  ) async {
    try {
      final response = await _dio.post('/courses', data: request.toJson());
      return Either.right(CourseModel.fromJson(response.data));
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = data is Map
          ? data['message']?.toString()
          : data?.toString();
      return Either.left(
        ServerFailure(message ?? 'An error occurred connecting to the server'),
      );
    } catch (e) {
      return Either.left(OtherFailure('Failed to create course'));
    }
  }

  Future<Either<Failure, JoinCourseResponse>> joinCourse(
    JoinCourseRequest request,
  ) async {
    try {
      final response = await _dio.post('/courses/join', data: request.toJson());
      return Either.right(JoinCourseResponse.fromJson(response.data));
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = data is Map
          ? data['message']?.toString()
          : data?.toString();
      return Either.left(
        ServerFailure(message ?? 'An error occurred connecting to the server'),
      );
    } catch (e) {
      return Either.left(OtherFailure('Failed to join course'));
    }
  }

  Future<Either<Failure, List<EnrolledCourse>>> getEnrolledCourses() async {
    try {
      final response = await _dio.get('/courses/enrolled');
      final data = response.data as List<dynamic>;

      final courses = data
          .map((json) => EnrolledCourse.fromJson(json as Map<String, dynamic>))
          .toList();

      return Either.right(courses);
    } on DioException catch (e) {
      return Either.left(
        ServerFailure(
          e.message ?? 'An error occurred connecting to the server',
        ),
      );
    } catch (e) {
      return Either.left(OtherFailure('Failed to process course data: $e'));
    }
  }

  Future<Either<Failure, void>> deleteCourse(String courseId) async {
    try {
      await _dio.delete('/courses/$courseId');
      return Either.right(null);
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = data is Map
          ? data['message']?.toString()
          : data?.toString();
      return Either.left(
        ServerFailure(message ?? 'An error occurred connecting to the server'),
      );
    } catch (e) {
      return Either.left(OtherFailure('Failed to delete course'));
    }
  }
}

@riverpod
CourseRepository courseRepository(CourseRepositoryRef ref) { 
  return CourseRepository(ref.watch(dioProvider));
}