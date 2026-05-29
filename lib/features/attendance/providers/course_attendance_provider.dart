import 'package:geotas/features/attendance/data/models/attendance_responses.dart';
import 'package:geotas/features/courses/data/repositories/course_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'course_attendance_provider.g.dart';

@riverpod
class CourseAttendanceNotifier extends _$CourseAttendanceNotifier {
  @override
  FutureOr<List<DetailedAttendanceModel>> build(String courseId) async {
    final repo = ref.watch(courseRepositoryProvider);
    final result = await repo.getCourseAttendance(courseId);

    return result.fold(
      ifLeft: (failure) => throw failure.message,
      ifRight: (attendance) => attendance,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(courseRepositoryProvider);
      final result = await repo.getCourseAttendance(courseId);
      return result.fold(
        ifLeft: (failure) => throw failure.message,
        ifRight: (attendance) => attendance,
      );
    });
  }
}