import 'package:auth/src/_src.dart';

abstract class RemoteAuthDataSource {
  Future<TokensDTO> signIn({required Map<String, dynamic> request});

  Future<TokensDTO> signUp({required Map<String, dynamic> request});

  Future<void> signOut();

  Future<AuthenticatedUser> getUserData();

  Future<TokensDTO> refreshToken({required String token});
}
