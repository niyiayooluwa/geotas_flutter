import 'package:geotas/features/auth/data/repositories/auth_repository.dart';
import 'package:geotas/features/auth/data/models/auth_request.dart';
import 'package:geotas/core/utils/validators.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_notifier.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier {
  @override
  FutureOr<void> build() => null;

  Future<bool> register({
    required String firstName,
    required String lastName,
    required String email,
    required String department,
    required String password,
  }) async {
    // Validate password before hitting the network
    final passwordError = validatePassword(password);
    if (passwordError != null) {
      state = AsyncValue.error(passwordError, StackTrace.current);
      return false;
    }

    state = const AsyncValue.loading();

    final repo = ref.read(authRepositoryProvider);
    final result = await repo.register(
      RegisterRequest(
        firstName: firstName,
        lastName: lastName,
        email: email,
        department: department,
        password: password,
      ),
    );

    return result.fold(
      ifLeft: (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
        return false;
      },
      ifRight: (_) {
        state = const AsyncValue.data(null);
        return true;
      },
    );
  }
}