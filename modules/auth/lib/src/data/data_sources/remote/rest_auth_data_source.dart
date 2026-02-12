import 'package:auth/src/_src.dart';
import 'package:dependencies/dependencies.dart';

part 'rest_auth_data_source.g.dart';

@RestApi()
abstract class RestRemoteAuthDataSource implements RemoteAuthDataSource {
  factory RestRemoteAuthDataSource(Dio dio, {String baseUrl}) =
      _RestRemoteAuthDataSource;

  @override
  @GET('/auth/current-user')
  Future<AuthenticatedUser> getUserData();

  @override
  @POST('/auth/refresh-token')
  Future<TokensDTO> refreshToken({@Body() required String token});

  @override
  @POST('/auth/sign-in')
  Future<TokensDTO> signIn({@Body() required Map<String, dynamic> request});

  @override
  @POST('/auth/sign-up')
  Future<TokensDTO> signUp({@Body() required Map<String, dynamic> request});

  @override
  @POST('/auth/sign-out')
  Future<void> signOut();
}
