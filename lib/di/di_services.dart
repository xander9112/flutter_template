import 'package:app_services/app_services.dart';
import 'package:i_app_services/i_app_services.dart';
import 'package:quiz/app/root_scope.dart';
import 'package:quiz/features/debug/_debug.dart';

/// {@template di_services}
/// Класс для инициализации и управления сервисами приложения.
///
/// Отвечает за:
/// - Инициализацию сервисов для работы с путями
/// - Инициализацию сервисов для работы с защищенным хранилищем
/// - Уведомление о прогрессе инициализации
/// - Обработку ошибок инициализации сервисов
/// {@endtemplate}
final class DiServices {
  /// {@macro di_services}
  DiServices(this.debugService);

  final IDebugService debugService;

  /// Сервис для работы с путями файловой системы
  late final IPathProvider pathProvider;

  /// Сервис для работы с защищенным локальным хранилищем
  late final ISecureStorage secureStorage;

  /// Сервис для работы с геолокацией
  late final ILocationService locationService;

  /// Метод для инициализации сервисов в приложении.
  ///
  /// Последовательность инициализации:
  /// 1. Инициализация сервиса путей (AppPathProvider)
  /// 2. Инициализация защищенного хранилища (AppSecureStorage)
  Future<void> init({required RootScope diContainer}) async {
    try {
      pathProvider = const AppPathProvider();

      debugService.log(AppPathProvider.name);
    } on Object catch (error, stackTrace) {
      debugService.logError(
        'Ошибка инициализации ${IPathProvider.name}',
        error: error,
        stackTrace: stackTrace,
      );
    }
    try {
      secureStorage = AppSecureStorage(
        secretKey: diContainer.appConfig.secretKey,
      );

      debugService.log(AppSecureStorage.name);
    } on Object catch (error, stackTrace) {
      debugService.logError(
        'Ошибка инициализации ${ISecureStorage.name}',
        error: error,
        stackTrace: stackTrace,
      );
    }

    try {
      locationService = const AppLocationService();
      debugService.log(AppLocationService.name);
    } on Object catch (error, stackTrace) {
      debugService.logError(
        'Ошибка инициализации ${ILocationService.name}',
        error: error,
        stackTrace: stackTrace,
      );
    }

    debugService.log('Инициализация сервисов завершена!');
  }
}
