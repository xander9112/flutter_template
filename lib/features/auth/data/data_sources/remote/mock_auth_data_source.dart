import 'package:quiz/features/auth/_auth.dart';

class MockRemoteAuthDataSource implements RemoteAuthDataSource {
  @override
  Future<AuthenticatedUser> getUserData() async {
    return Future.delayed(
      Duration.zero,
      () => const AuthenticatedUser(
        id: 1,
        email: 'demo@mail.ru',
        login: 'demo',
        lastName: 'Demovich',
        firstName: 'Demon',
      ),
    );
  }

  @override
  Future<TokensDTO> refreshToken({required String token}) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<TokensDTO> signIn({required Map<String, dynamic> request}) async {
    if (request['login'] == 'demo' && request['password'] == 'demo') {
      return Future.delayed(
        Duration.zero,
        () => const TokensDTO(
          accessToken: 'accessToken',
          refreshToken: 'refreshToken',
        ),
      );
    }

    throw Exception('User not found');
  }

  @override
  Future<TokensDTO> signUp({required Map<String, dynamic> request}) async {
    if (request['login'] == 'demo' && request['password'] == 'demo') {
      return Future.delayed(
        Duration.zero,
        () => const TokensDTO(
          accessToken: 'accessToken',
          refreshToken: 'refreshToken',
        ),
      );
    }

    throw Exception('User not found');
  }

  @override
  Future<void> signOut() async {
    return Future.value();
  }
}
