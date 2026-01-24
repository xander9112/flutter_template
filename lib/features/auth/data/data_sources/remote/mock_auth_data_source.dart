import 'package:quiz/features/auth/_auth.dart';

class MockRemoteAuthDataSource implements RemoteAuthDataSource {
  @override
  Future<TokensDTO> refreshToken({required String token}) {
    throw UnimplementedError();
  }

  @override
  Future<TokensDTO> signIn() {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }

  @override
  Future<TokensDTO> signUp() {
    throw UnimplementedError();
  }
}
