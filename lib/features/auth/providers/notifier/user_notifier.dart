import 'package:geotas/features/auth/data/models/user_model.dart';
import 'package:geotas/features/auth/data/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_notifier.g.dart';

// keepAlive: true — this provider is set immediately after login and read
// on every screen. autoDispose would tear it down between navigations.
@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  @override
  FutureOr<UserModel?> build() => null;

  Future<void> fetch() async {
    state = const AsyncValue.loading();

    final result = await ref.read(authRepositoryProvider).getMe();

    if (!ref.mounted) return;

    state = result.fold(
      ifLeft: (failure) =>
          AsyncValue.error(failure.message, StackTrace.current),
      ifRight: (user) => AsyncValue.data(user),
    );
  }

  void clear() {
    state = const AsyncValue.data(null);
  }
}