import 'package:quiz/features/auth/_auth.dart';

abstract class RemoteAuthDataSource {
  Future<TokensDTO> signIn({required Map<String, dynamic> request});

  Future<TokensDTO> signUp({required Map<String, dynamic> request});

  Future<void> signOut();

  Future<AuthenticatedUser> getUserData();

  Future<TokensDTO> refreshToken({required String token});
}
