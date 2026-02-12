import 'package:app/features/debug/i_debug_service.dart';
import 'package:app/features/debug/scope_observer.dart';
import 'package:auth/src/_src.dart';
import 'package:core/core.dart';
import 'package:i_app_services/i_app_services.dart';
import 'package:yx_scope/yx_scope.dart';

abstract class AuthScope implements Scope {
  IAuthManager<UserEntity> get authManager;

  SignInCubit get signInCubit;
  LocalAuthCubit get localAuthCubit;
}

class AuthScopeContainer extends ScopeContainer implements AuthScope {
  AuthScopeContainer({
    required IDebugService debugService,
    required ISecureStorage secureStorage,
    required AppHttpClient httpClient,
  }) : _debugService = debugService,
       _secureStorage = secureStorage,
       _httpClient = httpClient,
       super(name: 'AuthScope');

  final IDebugService _debugService;

  final ISecureStorage _secureStorage;

  final AppHttpClient _httpClient;

  @override
  List<Set<AsyncDep<dynamic>>> get initializeQueue => [{}];

  late final Dep<RemoteAuthDataSource> _remoteAuthDataSourceDep =
      dep<RemoteAuthDataSource>(
        () => RestRemoteAuthDataSource(_httpClient.client),
      );

  late final Dep<AuthStorage> _authStorageDep = dep<AuthStorage>(
    () => AuthStorage(storage: _secureStorage),
  );

  late final Dep<UserStorage> _userStorageDep = dep<UserStorage>(
    () => UserStorage(storage: _secureStorage),
  );

  late final Dep<IAuthRepository<TokensDTO, UserEntity>> _authRepositoryDep =
      dep<IAuthRepository<TokensDTO, UserEntity>>(
        () => AuthRepository(
          authStorage: _authStorageDep.get,
          remoteAuthDataSource: _remoteAuthDataSourceDep.get,
          userStorage: _userStorageDep.get,
        ),
      );

  late final Dep<IAuthManager<UserEntity>> _manager = dep<AuthManager>(
    () => AuthManager(
      debugService: _debugService,
      authRepository: _authRepositoryDep.get,
    ),
  );

  late final Dep<LocalAuthCubit> _localAuthCubitDep = dep<LocalAuthCubit>(
    () => LocalAuthCubit(
      authRepository: _authRepositoryDep.get,
      authManager: _manager.get,
    ),
  );

  late final Dep<SignInCubit> _signInCubitDep = dep<SignInCubit>(
    () => SignInCubit(
      repository: _authRepositoryDep.get,
      authManager: _manager.get,
    ),
  );

  @override
  IAuthManager<UserEntity> get authManager => _manager.get;

  @override
  LocalAuthCubit get localAuthCubit => _localAuthCubitDep.get;

  @override
  SignInCubit get signInCubit => _signInCubitDep.get;
}

class AuthScopeHolder extends ScopeHolder<AuthScopeContainer> {
  AuthScopeHolder({
    required IDebugService debugService,
    required ISecureStorage secureStorage,
    required AppHttpClient httpClient,
  }) : _debugService = debugService,
       _secureStorage = secureStorage,
       _httpClient = httpClient,
       super(scopeObservers: [ScopeObserverImpl(debugService: debugService)]);

  static const name = 'AuthScopeHolder';

  final IDebugService _debugService;

  final ISecureStorage _secureStorage;

  final AppHttpClient _httpClient;

  @override
  AuthScopeContainer createContainer() => AuthScopeContainer(
    debugService: _debugService,
    secureStorage: _secureStorage,
    httpClient: _httpClient,
  );
}
