import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/app/_app.dart';
import 'package:quiz/app/theme/app_theme.dart';
import 'package:quiz/app/theme/theme_notifier.dart';
import 'package:quiz/features/settings/_settings.dart';
import 'package:quiz/l10n/gen/app_localizations.dart';
import 'package:quiz/l10n/localization_notifier.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({required this.diContainer, required this.router, super.key});

  final DiContainer diContainer;

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
              child: BlocBuilder<SettingsCubit, SettingsState>(
                builder: (context, state) {
                  return MaterialApp.router(
                    darkTheme: AppTheme.dark,
                    theme: AppTheme.light,
                    themeMode: state.themeMode,
                    locale: localizationContext.localization.locale,
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                    routerConfig: router.config(
                      includePrefixMatches: true,
                      // deepLinkBuilder: (deepLink) => DeepLink.path('/settings'),
                      reevaluateListenable:
                          context.di.scopes.authScopeHolder.scope!.authManager,
                      navigatorObservers: diContainer.navigatorObservers,
                    ),
                    builder: (context, child) =>
                        App(child: child ?? SizedBox.shrink()),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
