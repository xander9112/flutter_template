import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quiz/app/app_context_ext.dart';
import 'package:quiz/app/app_providers.dart';
import 'package:quiz/app/theme/app_theme.dart';
import 'package:quiz/app/theme/theme_notifier.dart';
import 'package:quiz/di/di_container.dart';
import 'package:quiz/l10n/gen/app_localizations.dart';
import 'package:quiz/l10n/localization_notifier.dart';
import 'package:quiz/router/observer.dart';

/// {@template app}
/// Главный виджет приложения, отображающий основной интерфейс приложения
///
/// Отвечает за:
/// - Настройку провайдеров для темы и локализации
/// {@endtemplate}
class AppRoot extends StatelessWidget {
  /// {@macro app_root}
  const AppRoot({required this.diContainer, required this.router, super.key});

  /// Контейнер зависимостей
  final DiContainer diContainer;

  /// Роутер приложения
  final RootStackRouter router;

  @override
  Widget build(BuildContext context) {
    return AppProviders(
      diContainer: diContainer,
      child: LocalizationConsumer(
        builder: (localizationContext) {
          return ThemeConsumer(
            builder: (themeContext) => MediaQuery(
              key: const ValueKey('prevent_rebuild'),
              data: MediaQuery.of(
                themeContext,
              ).copyWith(textScaler: TextScaler.noScaling, boldText: false),
              child: MaterialApp.router(
                darkTheme: AppTheme.dark,
                theme: AppTheme.light,
                themeMode: themeContext.theme.themeMode,
                locale: localizationContext.localization.locale,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                routerConfig: router.config(
                  navigatorObservers: () => [MyObserver()],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
