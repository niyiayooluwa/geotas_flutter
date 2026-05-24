import 'package:geotas/features/auth/data/repositories/auth_repository.dart';
import 'package:geotas/core/storage/secure_storage.dart';
import 'package:geotas/features/auth/data/models/auth_request.dart';
import 'package:geotas/features/auth/providers/notifier/user_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_notifier.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  FutureOr<void> build() => null;

  Future<bool> login(String email, String password) async {
    state = const AsyncValue.loading();

    final repo = ref.read(authRepositoryProvider);
    final result = await repo.login(
      LoginRequest(email: email, password: password),
    );

    return result.fold(
      ifLeft: (failure) {
        state = AsyncValue.error(
          failure,
          StackTrace.current,
        ); // not failure.message
        return false;
      },
      ifRight: (response) async {
        // Save token first — the Dio interceptor picks it up immediately,
        // so the /me request that follows will be authenticated.
        final storage = ref.read(secureStorageProvider);
        await storage.saveToken(response.token);

        // Fetch and cache the user — dashboard can read this synchronously.
        await ref.read(userProvider.notifier).fetch();

        state = const AsyncValue.data(null);
        return true;
      },
    );
  }
}
