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

String _$courseSessionsHash() => r'877d31724d9f3a398af4f367b7c0ba6136108952';

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
