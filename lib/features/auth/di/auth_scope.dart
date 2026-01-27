import 'package:quiz/features/auth/_auth.dart';
import 'package:quiz/features/debug/i_debug_service.dart';
import 'package:quiz/features/debug/scope_observer.dart';
import 'package:yx_scope/yx_scope.dart';

abstract class AuthScope implements Scope {
  AuthManager get authManager;
}

class AuthScopeContainer extends ScopeContainer implements AuthScope {
  AuthScopeContainer({required IDebugService debugService})
    : _debugService = debugService,
      super(name: 'AuthScope');

  final IDebugService _debugService;

  @override
  List<Set<AsyncDep<dynamic>>> get initializeQueue => [
    {
      // rawAsyncDep(
      //   () => authManager,
      //   init: (dep) => dep.init(),
      //   dispose: Future.value,
      // ),
    },
  ];

  // late final Dep<AuthRepository> _authRepositoryDep = dep<AuthRepository>(() => AuthRepositoryImpl(dataSource: RemoteAuthDataSource(pa)))

  late final Dep<AuthManager> _manager = dep<AuthManager>(
    () => AuthManager(debugService: _debugService),
  );

  @override
  AuthManager get authManager => _manager.get;
}

class AuthScopeHolder extends ScopeHolder<AuthScopeContainer> {
  AuthScopeHolder({required IDebugService debugService})
    : _debugService = debugService,
      super(scopeObservers: [ScopeObserverImpl(debugService: debugService)]);

  static const name = 'AuthScopeHolder';

  final IDebugService _debugService;

  @override
  AuthScopeContainer createContainer() =>
      AuthScopeContainer(debugService: _debugService);
}
