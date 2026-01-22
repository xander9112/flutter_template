import 'package:quiz/features/auth/_auth.dart';

abstract class RemoteAuthDataSource {
  Future<TokensDTO> signIn();

  Future<TokensDTO> signUp();

  Future<void> signOut();

  Future<TokensDTO> refreshToken({required String token});
}
