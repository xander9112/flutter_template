import 'package:quiz/features/debug/_debug.dart';
import 'package:quiz/features/settings/_settings.dart';
import 'package:yx_scope/yx_scope.dart';

abstract class SettingsScope implements Scope {
  SettingsCubit get settingsCubit;
}

class SettingsScopeContainer extends ScopeContainer implements SettingsScope {
  SettingsScopeContainer({required IDebugService debugService})
    : _debugService = debugService,
      super(name: 'SettingsScope');

  final IDebugService _debugService;

  @override
  List<Set<AsyncDep<dynamic>>> get initializeQueue => [
    {_settingsDep},
  ];

  late final AsyncDep<SettingsCubit> _settingsDep = rawAsyncDep<SettingsCubit>(
    () => SettingsCubit(debugService: _debugService),
    init: (dep) => dep.init(),
    dispose: (dep) => dep.close(),
  );

  @override
  SettingsCubit get settingsCubit => _settingsDep.get;
}

class SettingsScopeHolder extends ScopeHolder<SettingsScopeContainer> {
  SettingsScopeHolder({required IDebugService debugService})
    : _debugService = debugService,
      super(scopeObservers: [ScopeObserverImpl(debugService: debugService)]);

  static const name = 'SettingsScopeHolder';

  final IDebugService _debugService;

  @override
  SettingsScopeContainer createContainer() =>
      SettingsScopeContainer(debugService: _debugService);
}
