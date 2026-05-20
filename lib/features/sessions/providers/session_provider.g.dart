// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CourseSessions)
const courseSessionsProvider = CourseSessionsFamily._();

final class CourseSessionsProvider
    extends $AsyncNotifierProvider<CourseSessions, List<SessionModel>> {
  const CourseSessionsProvider._({
    required CourseSessionsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'courseSessionsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$courseSessionsHash();

  @override
  String toString() {
    return r'courseSessionsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CourseSessions create() => CourseSessions();

  @override
  bool operator ==(Object other) {
    return other is CourseSessionsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$courseSessionsHash() => r'5d233d5d0f185a191380e62df106136c2536eecb';

final class CourseSessionsFamily extends $Family
    with
        $ClassFamilyOverride<
          CourseSessions,
          AsyncValue<List<SessionModel>>,
          List<SessionModel>,
          FutureOr<List<SessionModel>>,
          String
        > {
  const CourseSessionsFamily._()
    : super(
        retry: null,
        name: r'courseSessionsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CourseSessionsProvider call(String courseId) =>
      CourseSessionsProvider._(argument: courseId, from: this);

  @override
  String toString() => r'courseSessionsProvider';
}

abstract class _$CourseSessions extends $AsyncNotifier<List<SessionModel>> {
  late final _$args = ref.$arg as String;
  String get courseId => _$args;

  FutureOr<List<SessionModel>> build(String courseId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<List<SessionModel>>, List<SessionModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<SessionModel>>, List<SessionModel>>,
              AsyncValue<List<SessionModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(sessionQRToken)
const sessionQRTokenProvider = SessionQRTokenFamily._();

final class SessionQRTokenProvider
    extends
        $FunctionalProvider<
          AsyncValue<QRTokenResponse>,
          QRTokenResponse,
          FutureOr<QRTokenResponse>
        >
    with $FutureModifier<QRTokenResponse>, $FutureProvider<QRTokenResponse> {
  const SessionQRTokenProvider._({
    required SessionQRTokenFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'sessionQRTokenProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sessionQRTokenHash();

  @override
  String toString() {
    return r'sessionQRTokenProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<QRTokenResponse> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<QRTokenResponse> create(Ref ref) {
    final argument = this.argument as String;
    return sessionQRToken(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SessionQRTokenProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sessionQRTokenHash() => r'db7964c42a2bfa57275747f0fb06aeadc7f3e002';

final class SessionQRTokenFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<QRTokenResponse>, String> {
  const SessionQRTokenFamily._()
    : super(
        retry: null,
        name: r'sessionQRTokenProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SessionQRTokenProvider call(String sessionId) =>
      SessionQRTokenProvider._(argument: sessionId, from: this);

  @override
  String toString() => r'sessionQRTokenProvider';
}

@ProviderFor(sessionAttendance)
const sessionAttendanceProvider = SessionAttendanceFamily._();

final class SessionAttendanceProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<DetailedAttendanceModel>>,
          List<DetailedAttendanceModel>,
          FutureOr<List<DetailedAttendanceModel>>
        >
    with
        $FutureModifier<List<DetailedAttendanceModel>>,
        $FutureProvider<List<DetailedAttendanceModel>> {
  const SessionAttendanceProvider._({
    required SessionAttendanceFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'sessionAttendanceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sessionAttendanceHash();

  @override
  String toString() {
    return r'sessionAttendanceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<DetailedAttendanceModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<DetailedAttendanceModel>> create(Ref ref) {
    final argument = this.argument as String;
    return sessionAttendance(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SessionAttendanceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sessionAttendanceHash() => r'742e4e70f87138e0b8b512c34a3601a7e3b8cac2';

final class SessionAttendanceFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<DetailedAttendanceModel>>,
          String
        > {
  const SessionAttendanceFamily._()
    : super(
        retry: null,
        name: r'sessionAttendanceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SessionAttendanceProvider call(String sessionId) =>
      SessionAttendanceProvider._(argument: sessionId, from: this);

  @override
  String toString() => r'sessionAttendanceProvider';
}

@ProviderFor(allLecturerSessions)
const allLecturerSessionsProvider = AllLecturerSessionsProvider._();

final class AllLecturerSessionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SessionModel>>,
          List<SessionModel>,
          FutureOr<List<SessionModel>>
        >
    with
        $FutureModifier<List<SessionModel>>,
        $FutureProvider<List<SessionModel>> {
  const AllLecturerSessionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allLecturerSessionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allLecturerSessionsHash();

  @$internal
  @override
  $FutureProviderElement<List<SessionModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<SessionModel>> create(Ref ref) {
    return allLecturerSessions(ref);
  }
}

String _$allLecturerSessionsHash() =>
    r'9ce3ff40bb2dca0e44f18121abbd2ffbbf11c747';

@ProviderFor(sessionDetails)
const sessionDetailsProvider = SessionDetailsFamily._();

final class SessionDetailsProvider
    extends
        $FunctionalProvider<
          AsyncValue<SessionModel?>,
          SessionModel?,
          FutureOr<SessionModel?>
        >
    with $FutureModifier<SessionModel?>, $FutureProvider<SessionModel?> {
  const SessionDetailsProvider._({
    required SessionDetailsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'sessionDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sessionDetailsHash();

  @override
  String toString() {
    return r'sessionDetailsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<SessionModel?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SessionModel?> create(Ref ref) {
    final argument = this.argument as String;
    return sessionDetails(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SessionDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sessionDetailsHash() => r'905bb3142a49862174f3a42d1bd848a8922e0bc8';

final class SessionDetailsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<SessionModel?>, String> {
  const SessionDetailsFamily._()
    : super(
        retry: null,
        name: r'sessionDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SessionDetailsProvider call(String sessionId) =>
      SessionDetailsProvider._(argument: sessionId, from: this);

  @override
  String toString() => r'sessionDetailsProvider';
}
