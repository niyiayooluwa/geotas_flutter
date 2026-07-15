// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CourseNotifier)
const courseProvider = CourseNotifierProvider._();

final class CourseNotifierProvider
    extends $AsyncNotifierProvider<CourseNotifier, List<EnrolledCourse>> {
  const CourseNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'courseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$courseNotifierHash();

  @$internal
  @override
  CourseNotifier create() => CourseNotifier();
}

String _$courseNotifierHash() => r'777d4145f514ab1401d6be0907bd3d0380de4cf3';

abstract class _$CourseNotifier extends $AsyncNotifier<List<EnrolledCourse>> {
  FutureOr<List<EnrolledCourse>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<List<EnrolledCourse>>, List<EnrolledCourse>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<EnrolledCourse>>,
                List<EnrolledCourse>
              >,
              AsyncValue<List<EnrolledCourse>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
