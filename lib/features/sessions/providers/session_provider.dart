import 'package:geotas/features/attendance/data/models/attendance_responses.dart';
import 'package:geotas/features/attendance/data/repositories/attendance_repository.dart';
import 'package:geotas/features/courses/providers/course_provider.dart';
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

  Future<void> closeSession(String sessionId) async {
    final repo = ref.read(sessionRepositoryProvider);
    final result = await repo.closeSession(sessionId);

    result.fold(
      ifLeft: (failure) => throw failure.message,
      ifRight: (_) {
        ref.invalidateSelf();
      },
    );
  }

  Future<void> deleteSession(String sessionId) async {
  // 1. Save the current state in case the network fails
  final previousState = state.value;

  // 2. Optimistic UI Update: Instantly remove the session from the screen
  if (previousState != null) {
    state = AsyncValue.data(
      previousState.where((session) => session.id != sessionId).toList(),
    );
  }

  // 3. Send the request to the server in the background
  final repo = ref.read(sessionRepositoryProvider);
  final result = await repo.deleteSession(sessionId);

  result.fold(
    ifLeft: (failure) {
      // 4. Network dropped! Put the session back on the screen and throw error
      if (previousState != null) {
        state = AsyncValue.data(previousState);
      }
      throw failure.message;
    },
    ifRight: (_) {
      // Success! We don't need to invalidate/refetch because the local UI 
      // is already accurate. Saves bandwidth!
    },
  );
}
}

@riverpod
Future<QRTokenResponse> sessionQRToken(Ref ref, String sessionId) async {
  final repo = ref.watch(sessionRepositoryProvider);
  final result = await repo.getQRToken(sessionId);
  return result.fold(
    ifLeft: (failure) => throw failure.message,
    ifRight: (token) => token,
  );
}

@riverpod
Future<List<DetailedAttendanceModel>> sessionAttendance(
  Ref ref,
  String sessionId,
) async {
  final repo = ref.watch(attendanceRepositoryProvider);
  final result = await repo.getSessionAttendance(sessionId);
  return result.fold(
    ifLeft: (failure) => throw failure.message,
    ifRight: (attendance) => attendance,
  );
}

@riverpod
Future<List<SessionModel>> allLecturerSessions(Ref ref) async {
  final coursesAsync = ref.watch(courseProvider);
  final courses = coursesAsync.value ?? [];
  final lecturerCourses = courses.where((c) => c.role == 'lecturer').toList();

  List<SessionModel> allSessions = [];
  for (final course in lecturerCourses) {
    // ignore: unused_result
    final sessions = await ref.watch(courseSessionsProvider(course.id).future);
    allSessions.addAll(sessions);
  }

  allSessions.sort((a, b) => b.startedAt.compareTo(a.startedAt));
  return allSessions;
}

@riverpod
Future<SessionModel?> sessionDetails(Ref ref, String sessionId) async {
  final coursesAsync = ref.watch(courseProvider);
  final courses = coursesAsync.value ?? [];
  for (final course in courses) {
    final sessionsAsync = ref.watch(courseSessionsProvider(course.id));
    if (sessionsAsync.hasValue) {
      final session = sessionsAsync.value!
          .where((s) => s.id == sessionId)
          .firstOrNull;
      if (session != null) return session;
    }
  }
  return null;
}
