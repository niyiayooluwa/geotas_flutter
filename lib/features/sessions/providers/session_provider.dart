import 'package:geotas/features/sessions/data/models/session_model.dart';
import 'package:geotas/features/sessions/data/repositories/session_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_provider.g.dart';

@riverpod
class CourseSessions extends _$CourseSessions {
  @override
  FutureOr<List<SessionModel>> build(String courseId) async {
    final repo = ref.watch(sessionRepositoryProvider);
    final result = await repo.getCourseSessions(courseId);

    return result.fold(
      ifLeft: (failure) => throw failure.message,
      ifRight: (sessions) => sessions,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(sessionRepositoryProvider);
      final result = await repo.getCourseSessions(courseId);
      return result.fold(
        ifLeft: (failure) => throw failure.message,
        ifRight: (sessions) => sessions,
      );
    });
  }

  Future<void> createSession(CreateSessionRequest request) async {
    final repo = ref.read(sessionRepositoryProvider);
    final result = await repo.createSession(request);

    result.fold(
      ifLeft: (failure) => throw failure.message,
      ifRight: (session) {
        ref.invalidateSelf();
      },
    );
  }
}
