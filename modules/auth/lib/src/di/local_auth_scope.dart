import 'package:app/features/debug/i_debug_service.dart';
import 'package:app/features/debug/scope_observer.dart';
import 'package:auth/src/_src.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:yx_scope/yx_scope.dart';

abstract class LocalAuthScope implements Scope {
  LocalAuthCubit localAuthCubit({
    required String localizedReasonParam,
    required List<AuthMessages> authMessagesParam,
  });
}

class LocalAuthScopeContainer extends ChildScopeContainer<AuthScopeContainer>
    implements LocalAuthScope {
  LocalAuthScopeContainer(
    AuthScopeContainer authScopeContainer, {
    required IDebugService debugService,
    required IAuthManager<UserEntity> authManager,
  }) : _debugService = debugService,
       _authManager = authManager,
       super(name: 'LocalAuthScope', parent: authScopeContainer);

  final IDebugService _debugService;

  @override
  List<Set<AsyncDep<dynamic>>> get initializeQueue => [{}];

  final IAuthManager<UserEntity> _authManager;

  @override
  LocalAuthCubit localAuthCubit({
    required String localizedReasonParam,
    required List<AuthMessages> authMessagesParam,
  }) => LocalAuthCubit(
    authManager: _authManager,
    getBiometricSupportModel: GetBiometricSupportModel(_authManager),
    checkLocalAuthUseCase: CheckLocalAuthUseCase(_authManager),
    localizedReasonParam: localizedReasonParam,
    authMessagesParam: authMessagesParam,
  );
}

class LocalAuthScopeHolder
    extends
        BaseChildScopeHolder<
          LocalAuthScope,
          LocalAuthScopeContainer,
          AuthScopeContainer
        > {
  LocalAuthScopeHolder(
    super.parent, {
    required IDebugService debugService,

    required IAuthManager<UserEntity> authManager,
  }) : _debugService = debugService,
       _authManager = authManager,
       super(
         scopeObservers: [ScopeObserverImpl(debugService: debugService)],
       );

  static const name = 'LocalAuthScopeHolder';

  final IDebugService _debugService;

  final IAuthManager<UserEntity> _authManager;

  @override
  LocalAuthScopeContainer createContainer(
    AuthScopeContainer authScopeContainer,
  ) => LocalAuthScopeContainer(
    authScopeContainer,
    debugService: _debugService,
    authManager: _authManager,
  );
}
