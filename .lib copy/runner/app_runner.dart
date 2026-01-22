import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/app/app.dart';
import 'package:quiz/app/app_env.dart';
import 'package:quiz/app/error_screen.dart';
import 'package:quiz/app/root_scope.dart';
import 'package:quiz/features/debug/domain/debug_service.dart';
import 'package:quiz/features/debug/domain/i_debug_service.dart';
import 'package:quiz/runner/timer_runner.dart';
import 'package:url_strategy/url_strategy.dart';

part 'errors_handlers.dart';

/// Класс, реализующий раннер для конфигурирования приложения при запуске
///
/// Порядок инициализации:
/// 1. _initApp - инициализация конфигурации приложения
/// 2. инициализация репозиториев приложения (будет позже)
/// 3. runApp - запуск приложения
/// 4. _onAppLoaded - после запуска приложения
class AppRunner {
  /// Создает экземпляр раннера приложения
  ///
  /// Принимает:
  /// - [env] - тип окружения сборки приложения
  AppRunner(this.env);

  /// Тип окружения сборки приложения¬
  final AppEnv env;

  /// Контейнер зависимостей приложения
  late IDebugService _debugService;

  /// Роутер приложения
  // late RootStackRouter router;

  /// Таймер для отслеживания времени инициализации приложения
  late TimerRunner _timerRunner;

  /// Метод для запуска приложения
  Future<void> run(List<String> arguments) async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      // Инициализация сервиса отладки
      _debugService = DebugService();

      _timerRunner = TimerRunner(_debugService);

      // Инициализация Talker для логирования Bloc
      Bloc.observer = _debugService.blocObserver;

      // Инициализация приложения
      await _initApp();

      final diContainer = await _initDependencies(
        debugService: _debugService,
        env: env,
        timerRunner: _timerRunner,
      );
      // Инициализация метода обработки ошибок
      _initErrorHandlers(_debugService);

      runApp(AppRoot(diContainer: diContainer));
      await _onAppLoaded();
    } on Object catch (e, stackTrace) {
      await _onAppLoaded();
      _timerRunner.stop();

      /// Если произошла ошибка при инициализации приложения,
      /// то запускаем экран ошибки
      runApp(
        ErrorScreen(
          error: e,
          stackTrace: stackTrace,
          onRetry: () => run(arguments),
        ),
      );
    }
  }

  /// Метод инициализации приложения,
  /// выполняется до запуска приложения
  Future<void> _initApp() async {
    // Запрет на поворот экрана
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // Задает стратегию URL-адресации вашего веб-приложения, используя пути вместо префикса в начале URL.
    setPathUrlStrategy();

    // Заморозка первого кадра (сплеш)
    WidgetsBinding.instance.deferFirstFrame();
  }

  /// Метод срабатывает после запуска приложения
  Future<void> _onAppLoaded() async {
    // Разморозка первого кадра (сплеш)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      WidgetsBinding.instance.allowFirstFrame();
    });
  }

  // Метод для инициализации зависимостей приложения
  Future<RootScopeHolder> _initDependencies({
    required IDebugService debugService,
    required AppEnv env,
    required TimerRunner timerRunner,
  }) async {
    debugService.log(() => 'Тип сборки: ${env.name}');

    final diContainer = RootScopeHolder(env: env, debugService: debugService);

    await diContainer.create();

    return diContainer;
  }
}
