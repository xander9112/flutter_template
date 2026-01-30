import 'package:quiz/app/_app.dart';
import 'package:quiz/features/auth/_auth.dart';
import 'package:quiz/features/settings/di/settings_scope.dart';

/// {@template di_scopes}
/// Класс для инициализации и управления сервисами приложения.
///
/// Отвечает за:
/// - Инициализацию сервисов для работы с путями
/// - Инициализацию сервисов для работы с защищенным хранилищем
/// - Уведомление о прогрессе инициализации
/// - Обработку ошибок инициализации сервисов
/// {@endtemplate}
final class DiScopes {
  /// {@macro di_scopes}
  DiScopes();

  /// Скоуп для работы с авторизацией
  late final AuthScopeHolder authScopeHolder;

  /// Скоуп для работы с настройками
  late final SettingsScopeHolder settingsScopeHolder;

  /// Метод для инициализации сервисов в приложении.
  ///
  /// Принимает:
  /// - [onProgress] - обратный вызов для уведомления о прогрессе инициализации
  /// - [diContainer] - контейнер зависимостей с конфигурацией приложения
  /// - [onError] - обратный вызов для обработки ошибок инициализации
  ///
  /// Последовательность инициализации:
  /// 1. Инициализация сервиса путей (AppPathProvider)
  /// 2. Инициализация защищенного хранилища (AppSecureStorage)
  Future<void> init({
    required OnProgress onProgress,
    required OnError onError,
    required DiContainer diContainer,
  }) async {
    try {
      authScopeHolder = AuthScopeHolder(
        debugService: diContainer.debugService,
        secureStorage: diContainer.services.secureStorage,
      );

      await authScopeHolder.create();

      onProgress(AuthScopeHolder.name);
    } on Object catch (error, stackTrace) {
      onError(
        'Ошибка инициализации ${AuthScopeHolder.name}',
        error,
        stackTrace,
      );
    }

    try {
      settingsScopeHolder = SettingsScopeHolder(
        debugService: diContainer.debugService,
      );
      await settingsScopeHolder.create();

      onProgress(SettingsScopeHolder.name);
    } on Object catch (error, stackTrace) {
      onError(
        'Ошибка инициализации ${SettingsScopeHolder.name}',
        error,
        stackTrace,
      );
    }

    onProgress('Инициализация скоупов завершена!');
  }
}
