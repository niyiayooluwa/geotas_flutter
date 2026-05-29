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

String _$courseNotifierHash() => r'8ec1b7d0fdf1e4f214e078200b00cecb40cc178e';

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
