import 'package:quiz/app/app_env.dart';
import 'package:quiz/core/_core.dart';
import 'package:quiz/core/http/app_http_client.dart';
import 'package:quiz/di/di_services.dart';
import 'package:quiz/features/auth/_auth.dart';
import 'package:quiz/features/debug/_debug.dart';
import 'package:quiz/features/settings/_settings.dart';
import 'package:quiz/navigation/navigation_scope.dart';
import 'package:yx_scope/yx_scope.dart';

import 'app_config/app_config.dart';

abstract class RootScope implements Scope {
  /// Сервис для отладки, получаем из конструктора
  IDebugService get debugService;

  /// Конфигурация приложения
  IAppConfig get appConfig;

  /// Сервис для работы с HTTP запросами
  AppHttpClient get httpClient;

  AppEnv get env;

  DiServices get services;

  SettingsScopeHolder get settingsScopeHolder;

  AuthScopeHolder get authScopeHolder;

  NavigationScopeHolder get navigateScopeHolder;
}

class RootScopeContainer extends ScopeContainer implements RootScope {
  RootScopeContainer({required this.env, required IDebugService dService})
    : debugService = dService,
      super(name: 'RootScope');

  @override
  List<Set<AsyncDep<dynamic>>> get initializeQueue => [
    {
      rawAsyncDep<SettingsScopeHolder>(
        () => settingsScopeHolder,
        init: (dep) => dep.create(),
        dispose: (dep) => dep.drop(),
      ),
      rawAsyncDep<AuthScopeHolder>(
        () => authScopeHolder,
        init: (dep) => dep.create(),
        dispose: (dep) => dep.drop(),
      ),
      _navigateScopeHolder,
    },
  ];

  @override
  late final SettingsScopeHolder settingsScopeHolder = SettingsScopeHolder(
    this,
  );

  @override
  late final AuthScopeHolder authScopeHolder = AuthScopeHolder(this);

  late final AsyncDep<NavigationScopeHolder> _navigateScopeHolder = rawAsyncDep(
    () => NavigationScopeHolder(this),
    init: (dep) => dep.create(),
    dispose: (dep) => dep.drop(),
  );

  @override
  late final NavigationScopeHolder navigateScopeHolder =
      _navigateScopeHolder.get;

  @override
  late final IAppConfig appConfig = dep(
    () => switch (env) {
      .dev => AppConfigDev(),
      .prod => AppConfigProd(),
      .stage => AppConfigStage(),
    },
  ).get;

  @override
  final IDebugService debugService;

  @override
  final AppEnv env;

  @override
  late final AppHttpClient httpClient = dep(
    () => AppHttpClient(debugService: debugService, appConfig: appConfig),
  ).get;

  @override
  late final DiServices services = rawAsyncDep(
    () => DiServices(debugService),
    init: (dep) => dep.init(diContainer: this),
    dispose: Future.value,
  ).get;
}

class RootScopeHolder extends ScopeHolder<RootScopeContainer> {
  RootScopeHolder({required this.env, required this.debugService})
    : super(scopeObservers: [ScopeObserverImpl(logger: debugService)]);
  @override
  RootScopeContainer createContainer() =>
      RootScopeContainer(env: env, dService: debugService);

  final IDebugService debugService;

  final AppEnv env;
}
