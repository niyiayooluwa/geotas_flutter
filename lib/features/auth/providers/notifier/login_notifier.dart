import 'package:geotas/features/auth/data/repositories/auth_repository.dart';
import 'package:geotas/core/storage/secure_storage.dart';
import 'package:geotas/features/auth/data/models/auth_request.dart';
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
        state = AsyncValue.error(failure.message, StackTrace.current);
        return false;
      },
      ifRight: (response) async {
        final storage = ref.read(secureStorageProvider);
        await storage.saveToken(response.token);
        state = const AsyncValue.data(null);
        return true;
      },
    );
  }
}