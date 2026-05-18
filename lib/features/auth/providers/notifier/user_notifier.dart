import 'package:geotas/core/storage/secure_storage.dart';
import 'package:geotas/features/auth/data/models/user_model.dart';
import 'package:geotas/features/auth/data/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_notifier.g.dart';

// keepAlive: true — this provider is set immediately after login and read
// on every screen. autoDispose would tear it down between navigations.
@Riverpod(keepAlive: true)
class UserNotifier extends _$UserNotifier {
  @override
  FutureOr<UserModel?> build() async {
    // Check for existing token on startup
    final storage = ref.read(secureStorageProvider);
    final token = await storage.getToken();

    if (token == null) return null;

    // If token exists, fetch user details immediately
    final result = await ref.read(authRepositoryProvider).getMe();

    return result.fold(
      ifLeft: (failure) => null, // If /me fails, we start with no user
      ifRight: (user) => user,
    );
  }

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