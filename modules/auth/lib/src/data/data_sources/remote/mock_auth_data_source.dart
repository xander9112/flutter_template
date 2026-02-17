import 'package:auth/src/_src.dart';
import 'package:dependencies/dependencies.dart';

class MockRemoteAuthDataSource implements RemoteAuthDataSource {
  @override
  Future<AuthenticatedUser> getUserData() async {
    return Future.delayed(
      Duration.zero,
      () => const AuthenticatedUser(
        id: 1,
        email: 'demo@mail.ru',
        login: 'demo',
        lastName: 'Demonov',
        firstName: 'Demon',
      ),
    );
  }

  @override
  Future<TokensDTO> refreshToken({required String token}) {
    return Future.delayed(
      Duration.zero,
      () => const TokensDTO(
        accessToken: 'accessToken',
        refreshToken: 'refreshToken',
      ),
    );
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

    if (request['login'].toString().contains('@')) {
      throw DioException.badResponse(
        statusCode: 401,
        requestOptions: RequestOptions(),
        response: Response(
          requestOptions: RequestOptions(),
          data: {
            'error': {
              'code': 'UNAUTHENTICATED',
              'message': 'Wrong symbol',
              'fields': [
                {
                  'field': 'login',
                  'code': 'WRONG_SYMBOL',
                  'message': 'Do not use @',
                },
              ],
            },
          },
        ),
      );
    }

    throw DioException.badResponse(
      statusCode: 401,
      requestOptions: RequestOptions(),
      response: Response(
        requestOptions: RequestOptions(),
        data: {
          'error': {
            'code': 'UNAUTHENTICATED',
            'message': 'Wrong login or password',
            'fields': <Map<String, dynamic>>[],
          },
        },
      ),
    );
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
