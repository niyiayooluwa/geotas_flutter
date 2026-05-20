import 'package:geotas/features/attendance/data/models/attendance_responses.dart';
import 'package:geotas/features/attendance/data/repositories/attendance_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attendance_provider.g.dart';

@riverpod
class SessionAttendance extends _$SessionAttendance {
  @override
  FutureOr<List<DetailedAttendanceModel>> build(String sessionId) async {
    final repo = ref.watch(attendanceRepositoryProvider);
    final result = await repo.getSessionAttendance(sessionId);

    return result.fold(
      ifLeft: (failure) => throw failure.message,
      ifRight: (attendance) => attendance,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(attendanceRepositoryProvider);
      final result = await repo.getSessionAttendance(sessionId);
      return result.fold(
        ifLeft: (failure) => throw failure.message,
        ifRight: (attendance) => attendance,
      );
    });
  }
}
