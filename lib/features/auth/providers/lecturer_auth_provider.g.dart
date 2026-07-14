// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecturer_auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LecturerAuth)
const lecturerAuthProvider = LecturerAuthProvider._();

final class LecturerAuthProvider
    extends $AsyncNotifierProvider<LecturerAuth, void> {
  const LecturerAuthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lecturerAuthProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lecturerAuthHash();

  @$internal
  @override
  LecturerAuth create() => LecturerAuth();
}

String _$lecturerAuthHash() => r'3114e0b08f944ee2e68eec338b8ad61c8b28a658';

abstract class _$LecturerAuth extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
