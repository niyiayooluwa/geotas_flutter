import 'package:geotas/features/auth/data/repositories/auth_repository.dart';
import 'package:geotas/core/storage/secure_storage.dart';
import 'package:geotas/features/auth/providers/notifier/user_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_notifier.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  FutureOr<void> build() => null;

  Future<bool> signInWithGoogle() async {
    state = const AsyncValue.loading();

    final repo = ref.read(authRepositoryProvider);
    final result = await repo.signInWithGoogle();

    return result.fold(
      ifLeft: (failure) {
        state = AsyncValue.error(
          failure,
          StackTrace.current,
        );
        return false;
      },
      ifRight: (token) async {
        // Save the raw token string
        final storage = ref.read(secureStorageProvider);
        await storage.saveToken(token);

        // Fetch and cache the user
        await ref.read(userProvider.notifier).fetch();

        state = const AsyncValue.data(null);
        return true;
      },
    );
  }
}