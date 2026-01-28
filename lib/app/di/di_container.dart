import 'package:auto_route/auto_route.dart';
import 'package:quiz/app/_app.dart';
import 'package:quiz/core/_core.dart';
import 'package:quiz/features/debug/i_debug_service.dart';

/// {@template dependencies_container}
/// Контейнер для зависимостей
/// [env] - окружение приложения
/// [debugService] - сервис для отладки
/// {@endtemplate}
final class DiContainer {
  /// {@macro dependencies_container}
  DiContainer({required this.env, required IDebugService dService})
    : debugService = dService;
  final AppEnv env;

  /// Сервис для отладки, получаем из конструктора
  late final IDebugService debugService;

  /// Конфигурация приложения
  late final IAppConfig appConfig;

  /// Сервис для работы с HTTP запросами
  late final AppHttpClient httpClient;

  /// Репозитории приложения
  late final DiRepositories repositories;

  /// Сервисы приложения
  late final DiServices services;

  /// Скоупы
  late final DiScopes scopes;

  NavigatorObserversBuilder get navigatorObservers =>
      () => [_routerObserver];

  RouterObserver get _routerObserver =>
      RouterObserver(debugService: debugService);

  /// Метод для инициализации зависимостей
  Future<void> init({
    required OnProgress onProgress,
    required OnComplete onComplete,
    required OnError onError,
  }) async {
    // Инициализация конфигурации приложения
    appConfig = switch (env) {
      .dev => AppConfigDev(),
      .prod => AppConfigProd(),
      .stage => AppConfigStage(),
    };

    // Инициализация HTTP клиента
    httpClient = AppHttpClient(
      debugService: debugService,
      appConfig: appConfig,
    );

    // Инициализация сервисов
    services = DiServices()
      ..init(onProgress: onProgress, onError: onError, diContainer: this);
    // throw Exception('Тестовая - ошибка инициализации зависимостей');
    // Инициализация репозиториев
    repositories = DiRepositories()
      ..init(onProgress: onProgress, onError: onError, diContainer: this);

    scopes = DiScopes();

    await scopes.init(
      onProgress: onProgress,
      onError: onError,
      diContainer: this,
    );

    onComplete('Инициализация зависимостей завершена!');
  }
}
