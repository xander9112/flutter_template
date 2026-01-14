import 'package:quiz/app/_app.dart';
import 'package:quiz/core/_core.dart';
import 'package:quiz/features/_features.dart';
import 'package:yx_scope/yx_scope.dart';

abstract class AppScope implements Scope {
  AuthManager get authManager;

  AuthScopeHolder get authScopeHolder;

  SettingsCubit get settings;
}

class AppScopeContainer extends ChildScopeContainer<RootScope>
    implements AppScope {
  AppScopeContainer({required super.parent}) : super(name: 'AppScope');

  @override
  List<Set<AsyncDep<dynamic>>> get initializeQueue => [
    {
      _settings,
      rawAsyncDep<AuthManager>(
        () => authManager,
        init: (dep) => dep.init(),
        dispose: Future.value,
      ),
    },
  ];

  @override
  AuthManager get authManager => parent.authManagerDep.get;

  late final _authScopeHolder = dep(() => AuthScopeHolder(parent));

  late final _settings = rawAsyncDep(
    () => parent.settingsScopeHolder.scope!,
    init: (dep) => dep.settingsCubit.initSettingsFromServer(),
    dispose: Future.value,
  );

  @override
  SettingsCubit get settings => _settings.get.settingsCubit;

  @override
  AuthScopeHolder get authScopeHolder => _authScopeHolder.get;
}

class AppScopeHolder
    extends BaseChildScopeHolder<AppScope, AppScopeContainer, RootScope> {
  AppScopeHolder(super.parent)
    : super(scopeObservers: [ScopeObserverImpl(logger: AppLogger())]);
  @override
  AppScopeContainer createContainer(RootScope parent) =>
      AppScopeContainer(parent: parent);
}
