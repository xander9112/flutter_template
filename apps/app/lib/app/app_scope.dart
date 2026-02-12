import 'package:app/features/debug/_debug.dart';
import 'package:app/features/settings/_settings.dart';
import 'package:auth/auth.dart';
import 'package:yx_scope/yx_scope.dart';

abstract class AppScope implements Scope {
  AuthScope get authScope;
  SettingsScope get settingsScope;
}

class AppScopeContainer extends ScopeContainer implements AppScope {
  AppScopeContainer({required this.authScope, required this.settingsScope})
    : super(name: 'AppScope');

  @override
  final AuthScope authScope;

  @override
  final SettingsScope settingsScope;

  @override
  List<Set<AsyncDep<dynamic>>> get initializeQueue => [
    {
      rawAsyncDep<SettingsScope>(
        () => settingsScope,
        init: (dep) => dep.settingsCubit.initSettingsFromServer(),
        dispose: Future.value,
      ),
      rawAsyncDep<AuthScope>(
        () => authScope,
        init: (dep) => dep.authManager.init(),
        dispose: Future.value,
      ),
    },
  ];
}

class AppScopeHolder extends ScopeHolder<AppScopeContainer> {
  AppScopeHolder({
    required this.authScope,
    required this.settingsScope,
    required this.debugService,
  }) : super(scopeObservers: [ScopeObserverImpl(debugService: debugService)]);

  final AuthScope authScope;
  final SettingsScope settingsScope;

  final IDebugService debugService;

  @override
  AppScopeContainer createContainer() =>
      AppScopeContainer(authScope: authScope, settingsScope: settingsScope);
}
