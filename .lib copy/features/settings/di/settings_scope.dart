import 'package:quiz/app/root_scope.dart';
import 'package:quiz/core/_core.dart';
import 'package:quiz/features/settings/_settings.dart';
import 'package:yx_scope/yx_scope.dart';

abstract class SettingsScope implements Scope {
  SettingsCubit get settingsCubit;
}

class SettingsScopeContainer extends ChildScopeContainer<RootScope>
    implements SettingsScope {
  SettingsScopeContainer({required super.parent})
    : super(name: 'SettingsScope');

  @override
  List<Set<AsyncDep<dynamic>>> get initializeQueue => [
    {_settingsDep},
  ];

  late final AsyncDep<SettingsCubit> _settingsDep = rawAsyncDep<SettingsCubit>(
    () => SettingsCubit(debugService: parent.debugService),
    init: (dep) => dep.init(),
    dispose: (dep) => dep.close(),
  );

  @override
  SettingsCubit get settingsCubit => _settingsDep.get;
}

class SettingsScopeHolder
    extends
        BaseChildScopeHolder<SettingsScope, SettingsScopeContainer, RootScope> {
  SettingsScopeHolder(super.parent)
    : super(scopeObservers: [ScopeObserverImpl(logger: parent.debugService)]);
  @override
  SettingsScopeContainer createContainer(RootScope parent) =>
      SettingsScopeContainer(parent: parent);
}
