import 'package:geotas/features/auth/data/models/user_model.dart';
import 'package:geotas/features/auth/data/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_notifier.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  FutureOr<UserModel?> build() => null;

  Future<void> fetch() async {
    state = const AsyncValue.loading();

    final result = await ref.read(authRepositoryProvider).getMe();

    state = result.fold(
      ifLeft: (failure) => AsyncValue.error(failure.message, StackTrace.current),
      ifRight: (user) => AsyncValue.data(user),
    );
  }

  void clear() {
    state = const AsyncValue.data(null);
  }
}