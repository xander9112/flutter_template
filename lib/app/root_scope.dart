import 'package:quiz/core/_core.dart';
import 'package:quiz/features/_features.dart';
import 'package:yx_scope/yx_scope.dart';

abstract class RootScope implements Scope {
  Dep<AppLogger> get loggerDep;

  SettingsScopeHolder get settingsScopeHolder;
  AuthScopeHolder get authScopeHolder;
}

class RootScopeContainer extends ScopeContainer implements RootScope {
  RootScopeContainer() : super(name: 'RootScope');

  @override
  late final Dep<AppLogger> loggerDep = dep<AppLogger>(() => AppLogger());

  @override
  List<Set<AsyncDep<dynamic>>> get initializeQueue => [
    {_settingsScopeHolder, _authScopeHolder},
  ];

  late final AsyncDep<SettingsScopeHolder> _settingsScopeHolder =
      rawAsyncDep<SettingsScopeHolder>(
        () => SettingsScopeHolder(this),
        init: (dep) => dep.create(),
        dispose: (dep) => dep.drop(),
      );

  late final AsyncDep<AuthScopeHolder> _authScopeHolder =
      rawAsyncDep<AuthScopeHolder>(
        () => AuthScopeHolder(this),
        init: (dep) => dep.create(),
        dispose: (dep) => dep.drop(),
      );

  @override
  SettingsScopeHolder get settingsScopeHolder => _settingsScopeHolder.get;

  @override
  AuthScopeHolder get authScopeHolder => _authScopeHolder.get;
}

class RootScopeHolder extends ScopeHolder<RootScopeContainer> {
  RootScopeHolder()
    : super(scopeObservers: [ScopeObserverImpl(logger: AppLogger())]);
  @override
  RootScopeContainer createContainer() => RootScopeContainer();
}
