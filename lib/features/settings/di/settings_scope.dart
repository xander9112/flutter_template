import 'package:quiz/core/_core.dart';
import 'package:quiz/features/settings/_settings.dart';
import 'package:yx_scope/yx_scope.dart';

abstract class SettingsScope implements Scope {
  SettingsCubit get settingsCubit;
}

class SettingsScopeContainer extends ScopeContainer implements SettingsScope {
  SettingsScopeContainer() : super(name: 'SettingsScope');

  @override
  List<Set<AsyncDep<dynamic>>> get initializeQueue => [
    {_settingsDep},
  ];

  late final AsyncDep<SettingsCubit> _settingsDep = rawAsyncDep<SettingsCubit>(
    () => SettingsCubit(logger: AppLogger()),
    init: (dep) => dep.init(),
    dispose: (dep) => dep.close(),
  );

  @override
  SettingsCubit get settingsCubit => _settingsDep.get;
}

class SettingsScopeHolder extends ScopeHolder<SettingsScopeContainer> {
  SettingsScopeHolder()
    : super(scopeObservers: [ScopeObserverImpl(logger: AppLogger())]);
  @override
  SettingsScopeContainer createContainer() => SettingsScopeContainer();
}
