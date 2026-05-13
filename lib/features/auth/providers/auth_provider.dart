import 'package:geotas/core/storage/secure_storage.dart';
import 'package:geotas/features/auth/data/models/auth_request.dart';
import 'package:geotas/features/auth/data/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

// AsyncNotifier that manages authentication state.
// State is void because we don't store user data here —
// we only care whether an auth action succeeded, failed, or is loading.
// Token is persisted separately in SecureStorage.
@riverpod
class Auth extends _$Auth {
  @override
  FutureOr<void> build() {
    // No initial async work needed.
    // State starts as AsyncData(null) — idle, not loading, no error.
    return null;
  }

  Future<bool> login(String email, String password) async {
    // Signal to the UI that a network call is in flight.
    // Any widget watching this provider will see AsyncLoading.
    state = const AsyncValue.loading();

    final repo = ref.read(authRepositoryProvider);
    final request = LoginRequest(email: email, password: password);

    final result = await repo.login(request);

    return result.fold(
      ifLeft: (failure) {
        // Login failed — push the error message into state so the UI
        // can display it, then return false so the caller knows not to navigate.
        state = AsyncValue.error(failure.message, StackTrace.current);
        return false;
      },
      ifRight: (response) async {
        // Login succeeded — persist the JWT token securely before
        // marking state as done. Order matters here: storage first,
        // then state update, so the UI never navigates before the token is saved.
        final storage = ref.read(secureStorageProvider);
        await storage.saveToken(response.token);

        state = const AsyncValue.data(null);
        return true;
      },
    );
  }

  Future<bool> register(RegisterRequest request) async {
    final passwordError = validatePassword(request.password);
    if (passwordError != null) {
      state = AsyncValue.error(passwordError, StackTrace.current);
      return false;
    }

    state = const AsyncValue.loading();

    final repo = ref.read(authRepositoryProvider);
    final result = await repo.register(request);

    return result.fold(
      ifLeft: (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
        return false;
      },
      ifRight: (response) {
        // Register succeeded but the backend does not return a token —
        // user must log in manually after registration.
        // We set state to data(null) so the UI knows the action completed cleanly.
        state = const AsyncValue.data(null);
        return true;
      },
    );
  }

  Future<void> logout() async {
    // Wipe the token from secure storage. The router's redirect logic
    // should pick up the missing token on next evaluation and push
    // the user back to the login screen.
    final storage = ref.read(secureStorageProvider);
    await storage.deleteToken();
  }

  String? validatePassword(String password) {
    final hasUpper = password.contains(RegExp(r'[A-Z]'));
    final hasLower = password.contains(RegExp(r'[a-z]'));
    final hasDigit = password.contains(RegExp(r'[0-9]'));
    final hasSpecial = password.contains(RegExp(r'[@$!%*?&]'));
    final hasMinLength = password.length >= 8;

    if (!hasMinLength) return 'Password must be at least 8 characters';
    if (!hasUpper) return 'Password must contain an uppercase letter';
    if (!hasLower) return 'Password must contain a lowercase letter';
    if (!hasDigit) return 'Password must contain a number';
    if (!hasSpecial) {
      return 'Password must contain a special character (@\$!%*?&)';
    }

    return null; // null means valid
  }
}
