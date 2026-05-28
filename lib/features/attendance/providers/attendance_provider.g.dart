// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SessionAttendance)
const sessionAttendanceProvider = SessionAttendanceFamily._();

final class SessionAttendanceProvider
    extends
        $AsyncNotifierProvider<
          SessionAttendance,
          List<DetailedAttendanceModel>
        > {
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
  SessionAttendance create() => SessionAttendance();

  @override
  bool operator ==(Object other) {
    return other is SessionAttendanceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sessionAttendanceHash() => r'154594fa116ff0b249657402950ebcec3a1c4861';

final class SessionAttendanceFamily extends $Family
    with
        $ClassFamilyOverride<
          SessionAttendance,
          AsyncValue<List<DetailedAttendanceModel>>,
          List<DetailedAttendanceModel>,
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

abstract class _$SessionAttendance
    extends $AsyncNotifier<List<DetailedAttendanceModel>> {
  late final _$args = ref.$arg as String;
  String get sessionId => _$args;

  FutureOr<List<DetailedAttendanceModel>> build(String sessionId);
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

@ProviderFor(MarkAttendance)
const markAttendanceProvider = MarkAttendanceProvider._();

final class MarkAttendanceProvider
    extends $NotifierProvider<MarkAttendance, AsyncValue<AttendanceResponse?>> {
  const MarkAttendanceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'markAttendanceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$markAttendanceHash();

  @$internal
  @override
  MarkAttendance create() => MarkAttendance();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<AttendanceResponse?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<AttendanceResponse?>>(
        value,
      ),
    );
  }
}

String _$markAttendanceHash() => r'c0c6d067bb8b694d54d90884d69d2aed9d399406';

abstract class _$MarkAttendance
    extends $Notifier<AsyncValue<AttendanceResponse?>> {
  AsyncValue<AttendanceResponse?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<AttendanceResponse?>,
              AsyncValue<AttendanceResponse?>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<AttendanceResponse?>,
                AsyncValue<AttendanceResponse?>
              >,
              AsyncValue<AttendanceResponse?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
