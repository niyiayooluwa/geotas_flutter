import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:geotas/core/errors/failure_mapper.dart';
import 'package:geotas/core/errors/failures.dart';
import 'package:geotas/core/network/dio_client.dart';
import 'package:geotas/features/auth/data/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final Dio _dio;
  final String _webClientId = 'YOUR_WEB_CLIENT_ID.apps.googleusercontent.com';

  // 1. Add this flag
  bool _isGoogleInitialized = false;

  AuthRepository(this._dio);

  Future<Either<Failure, String>> signInWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn.instance;

      // 2. Wrap the initialization in the check
      if (!_isGoogleInitialized) {
        await googleSignIn.initialize(clientId: _webClientId);
        _isGoogleInitialized = true;
      }

      // Force sign-out to allow account selection
      await googleSignIn.signOut();

      // The rest of the code stays exactly the same...
      final googleUser = await googleSignIn.authenticate();

      final googleAuth = googleUser.authentication;
      final String? idToken = googleAuth.idToken;

      if (idToken == null) {
        return const Either.left(
          ServerFailure('Failed to retrieve Google ID token'),
        );
      }

      final response = await _dio.post(
        '/auth/google',
        data: {'id_token': idToken},
      );

      return Either.right(response.data['token'] as String);
    } on DioException catch (e) {
      return Either.left(mapDioException(e));
    } catch (e) {
      return Either.left(mapException(e));
    }
  }

  // ... getMe() stays the same

  Future<Either<Failure, UserModel>> getMe() async {
    try {
      final response = await _dio.get('/me');
      return Either.right(UserModel.fromJson(response.data));
    } on DioException catch (e) {
      return Either.left(mapDioException(e));
    } catch (e) {
      return Either.left(mapException(e));
    }
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return AuthRepository(ref.watch(dioProvider));
}
