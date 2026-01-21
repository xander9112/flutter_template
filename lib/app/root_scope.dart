import 'package:quiz/app/app_env.dart';
import 'package:quiz/core/_core.dart';
import 'package:quiz/core/http/app_http_client.dart';
import 'package:quiz/di/di_services.dart';
import 'package:quiz/features/debug/_debug.dart';
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
}

class RootScopeContainer extends ScopeContainer implements RootScope {
  RootScopeContainer({required this.env, required IDebugService dService})
    : debugService = dService,
      super(name: 'RootScope');

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
    () => DiServices(),
    init: (dep) => Future.value(() {
      dep.init(diContainer: this);

      return null;
    }),
    dispose: Future.value,
  ).get;
}

class RootScopeHolder extends ScopeHolder<RootScopeContainer> {
  RootScopeHolder({required this.env, required this.debugService})
    : super(scopeObservers: [ScopeObserverImpl(logger: AppLogger())]);
  @override
  RootScopeContainer createContainer() =>
      RootScopeContainer(env: env, dService: debugService);

  final IDebugService debugService;

  final AppEnv env;
}
