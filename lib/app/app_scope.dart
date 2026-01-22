import 'package:quiz/app/_app.dart';
import 'package:quiz/core/_core.dart';
import 'package:quiz/features/_features.dart';
import 'package:yx_scope/yx_scope.dart';

abstract class AppScope implements Scope {
  AuthScope get authScope;
  SettingsScope get settingsScope;
}

class AppScopeContainer extends ChildScopeContainer<RootScope>
    implements AppScope {
  AppScopeContainer({
    required super.parent,
    required this.authScope,
    required this.settingsScope,
  }) : super(name: 'AppScope');

  @override
  final AuthScope authScope;

  @override
  final SettingsScope settingsScope;

  @override
  List<Set<AsyncDep<dynamic>>> get initializeQueue => [
    {
      _settings,
      rawAsyncDep<AuthScope>(
        () => authScope,
        init: (dep) => dep.authManager.init(),
        dispose: Future.value,
      ),
    },
  ];

  // @override
  // AuthManager get authManager => parent.authManagerDep.get;

  // late final _authScopeHolder = dep(() => AuthScopeHolder(parent));

  late final _settings = rawAsyncDep(
    () => settingsScope,
    init: (dep) => dep.settingsCubit.initSettingsFromServer(),
    dispose: Future.value,
  );

  // @override
  // SettingsCubit get settings => _settings.get.settingsCubit;

  // @override
  // AuthScopeHolder get authScopeHolder => _authScopeHolder.get;
}

class AppScopeHolder
    extends BaseChildScopeHolder<AppScope, AppScopeContainer, RootScope> {
  AppScopeHolder(
    super.parent, {
    required this.authScope,
    required this.settingsScope,
  }) : super(scopeObservers: [ScopeObserverImpl(logger: parent.debugService)]);

  final AuthScope authScope;
  final SettingsScope settingsScope;

  @override
  AppScopeContainer createContainer(RootScope parent) => AppScopeContainer(
    parent: parent,
    authScope: authScope,
    settingsScope: settingsScope,
  );
}
