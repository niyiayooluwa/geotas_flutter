import 'package:geotas/features/courses/data/models/course_requests.dart';
import 'package:geotas/features/courses/data/models/course_responses.dart';
import 'package:geotas/features/courses/data/repositories/course_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'course_provider.g.dart';

@riverpod
class CourseNotifier extends _$CourseNotifier {
  @override
  FutureOr<List<EnrolledCourse>> build() async {
    final result = await ref
        .read(courseRepositoryProvider)
        .getEnrolledCourses();

    return result.fold(
      ifLeft: (failure) => throw failure.message,
      ifRight: (courses) => courses,
    );
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }

  Future<bool> createCourse({
    required String title,
    required String code,
    required String department,
  }) async {
    final result = await ref.read(courseRepositoryProvider).createCourse(
          CreateCourseRequest(title: title, code: code, department: department),
        );

    return result.fold(
      ifLeft: (failure) => throw failure.message,
      ifRight: (_) {
        ref.invalidateSelf();
        return true;
      },
    );
  }

  Future<bool> joinCourse({
    required String inviteCode,
    required String matriculationNumber,
  }) async {
    final result = await ref.read(courseRepositoryProvider).joinCourse(
          JoinCourseRequest(
            inviteCode: inviteCode,
            matriculationNumber: matriculationNumber,
          ),
        );

    return result.fold(
      ifLeft: (failure) => throw failure.message,
      ifRight: (_) {
        ref.invalidateSelf();
        return true;
      },
    );
  }
}