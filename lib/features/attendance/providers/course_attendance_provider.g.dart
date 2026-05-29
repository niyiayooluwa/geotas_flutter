// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_attendance_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CourseAttendanceNotifier)
const courseAttendanceProvider = CourseAttendanceNotifierFamily._();

final class CourseAttendanceNotifierProvider
    extends
        $AsyncNotifierProvider<
          CourseAttendanceNotifier,
          List<DetailedAttendanceModel>
        > {
  const CourseAttendanceNotifierProvider._({
    required CourseAttendanceNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'courseAttendanceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$courseAttendanceNotifierHash();

  @override
  String toString() {
    return r'courseAttendanceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CourseAttendanceNotifier create() => CourseAttendanceNotifier();

  @override
  bool operator ==(Object other) {
    return other is CourseAttendanceNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$courseAttendanceNotifierHash() =>
    r'5e573ee86c8552ebf087013a53adff3b0191f17c';

final class CourseAttendanceNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          CourseAttendanceNotifier,
          AsyncValue<List<DetailedAttendanceModel>>,
          List<DetailedAttendanceModel>,
          FutureOr<List<DetailedAttendanceModel>>,
          String
        > {
  const CourseAttendanceNotifierFamily._()
    : super(
        retry: null,
        name: r'courseAttendanceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CourseAttendanceNotifierProvider call(String courseId) =>
      CourseAttendanceNotifierProvider._(argument: courseId, from: this);

  @override
  String toString() => r'courseAttendanceProvider';
}

abstract class _$CourseAttendanceNotifier
    extends $AsyncNotifier<List<DetailedAttendanceModel>> {
  late final _$args = ref.$arg as String;
  String get courseId => _$args;

  FutureOr<List<DetailedAttendanceModel>> build(String courseId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<DetailedAttendanceModel>>,
              List<DetailedAttendanceModel>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<DetailedAttendanceModel>>,
                List<DetailedAttendanceModel>
              >,
              AsyncValue<List<DetailedAttendanceModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
