import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/app/app_env.dart';
import 'package:quiz/app/app_root.dart';
import 'package:quiz/di/di_container.dart';
import 'package:quiz/features/debug/debug_service.dart';
import 'package:quiz/features/debug/i_debug_service.dart';
import 'package:quiz/features/error/error_screen.dart';
import 'package:quiz/router/app_router.dart';
import 'package:quiz/runner/timer_runner.dart';
import 'package:url_strategy/url_strategy.dart';

part 'errors_handlers.dart';

class AppRunner {
  AppRunner(this.env);

  final AppEnv env;

  late IDebugService _debugService;

  late TimerRunner _timerRunner;

  Future<void> run(List<String> arguments) async {
    try {
      WidgetsFlutterBinding.ensureInitialized();

      _debugService = DebugService();

      _timerRunner = TimerRunner(_debugService);

      Bloc.observer = _debugService.blocObserver;

      await _initApp();

      final diContainer = await _initDependencies(
        debugService: _debugService,
        env: env,
        timerRunner: _timerRunner,
      );

      _initErrorHandlers(_debugService);

      runApp(
        AppRoot(
          diContainer: diContainer,
          router: AppRouter.createRouter(
            _debugService,
            diContainer.scopes.authScopeHolder.scope!.authManager,
          ),
        ),
      );

      await _onAppLoaded();
    } on Object catch (e, stackTrace) {
      await _onAppLoaded();
      _timerRunner.stop();

      runApp(
        ErrorScreen(
          error: e,
          stackTrace: stackTrace,
          onRetry: () => run(arguments),
        ),
      );
    }
  }

  Future<void> _initApp() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    setPathUrlStrategy();

    WidgetsBinding.instance.deferFirstFrame();
  }

  Future<void> _onAppLoaded() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      WidgetsBinding.instance.allowFirstFrame();
    });
  }

  Future<DiContainer> _initDependencies({
    required IDebugService debugService,
    required AppEnv env,
    required TimerRunner timerRunner,
  }) async {
    debugService.log(() => 'Тип сборки: ${env.name}');
    final diContainer = DiContainer(env: env, dService: debugService);
    await diContainer
        .init(
          onProgress: (name) => timerRunner.logOnProgress(name),
          onComplete: (name) {
            timerRunner
              ..logOnComplete(name)
              ..stop();
          },
          onError: (message, error, [stackTrace]) {
            timerRunner.stop();
            _debugService.logError(
              message,
              error: error,
              stackTrace: stackTrace,
            );
            throw Exception('Ошибка инициализации зависимостей: $message');
          },
        )
        .timeout(
          const Duration(seconds: 7),
          onTimeout: () {
            throw Exception(
              'Превышено время ожидания инициализации зависимостей',
            );
          },
        );
    return diContainer;
  }
}
