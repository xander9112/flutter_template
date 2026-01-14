import 'package:auto_route/auto_route.dart';
import 'package:quiz/core/_core.dart';
import 'package:quiz/features/_features.dart';
import 'package:yx_scope/yx_scope.dart';

import '../navigation/app_router.dart';

abstract class RootScope implements Scope {
  Dep<AppLogger> get loggerDep;
  Dep<RootStackRouter> get routerDep;
  Dep<AuthManager> get authManagerDep;

  SettingsScopeHolder get settingsScopeHolder;
}

class RootScopeContainer extends ScopeContainer implements RootScope {
  RootScopeContainer() : super(name: 'RootScope');

  @override
  List<Set<AsyncDep<dynamic>>> get initializeQueue => [
    {_settingsScopeHolder},
  ];

  @override
  late final Dep<AppLogger> loggerDep = dep<AppLogger>(() => AppLogger());

  @override
  late final Dep<AuthManager> authManagerDep = dep<AuthManager>(
    () => AuthManager(logger: loggerDep.get),
  );

  late final AsyncDep<SettingsScopeHolder> _settingsScopeHolder =
      rawAsyncDep<SettingsScopeHolder>(
        () => SettingsScopeHolder(),
        init: (dep) => dep.create(),
        dispose: (dep) => dep.drop(),
      );

  @override
  SettingsScopeHolder get settingsScopeHolder => _settingsScopeHolder.get;

  @override
  late final Dep<RootStackRouter> routerDep = dep<RootStackRouter>(
    () => AppRouter(authManager: authManagerDep.get),
  );
}

class RootScopeHolder extends ScopeHolder<RootScopeContainer> {
  RootScopeHolder()
    : super(scopeObservers: [ScopeObserverImpl(logger: AppLogger())]);
  @override
  RootScopeContainer createContainer() => RootScopeContainer();
}
