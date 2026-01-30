import 'package:i_app_services/i_app_services.dart';
import 'package:quiz/features/auth/_auth.dart';
import 'package:quiz/features/debug/i_debug_service.dart';
import 'package:quiz/features/debug/scope_observer.dart';
import 'package:yx_scope/yx_scope.dart';

abstract class AuthScope implements Scope {
  IAuthManager<UserEntity> get authManager;

  LocalAuthCubit get localAuthCubit;
}

class AuthScopeContainer extends ScopeContainer implements AuthScope {
  AuthScopeContainer({
    required IDebugService debugService,
    required ISecureStorage secureStorage,
  }) : _debugService = debugService,
       _secureStorage = secureStorage,
       super(name: 'AuthScope');

  final IDebugService _debugService;

  final ISecureStorage _secureStorage;

  @override
  List<Set<AsyncDep<dynamic>>> get initializeQueue => [{}];

  late final Dep<RemoteAuthDataSource> _remoteAuthDataSourceDep =
      dep<RemoteAuthDataSource>(MockRemoteAuthDataSource.new);

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

  @override
  IAuthManager<UserEntity> get authManager => _manager.get;

  @override
  LocalAuthCubit get localAuthCubit => _localAuthCubitDep.get;
}

class AuthScopeHolder extends ScopeHolder<AuthScopeContainer> {
  AuthScopeHolder({
    required IDebugService debugService,
    required ISecureStorage secureStorage,
  }) : _debugService = debugService,
       _secureStorage = secureStorage,
       super(scopeObservers: [ScopeObserverImpl(debugService: debugService)]);

  static const name = 'AuthScopeHolder';

  final IDebugService _debugService;

  final ISecureStorage _secureStorage;

  @override
  AuthScopeContainer createContainer() => AuthScopeContainer(
    debugService: _debugService,
    secureStorage: _secureStorage,
  );
}
