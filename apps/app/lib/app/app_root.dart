import 'package:app/app/_app.dart';
import 'package:app/app/theme/app_theme.dart';
import 'package:app/features/settings/_settings.dart';
import 'package:auth/auth.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({required this.diContainer, required this.router, super.key});

  final DiContainer diContainer;

  final RootStackRouter router;

  @override
  Widget build(BuildContext context) {
    return AppProviders(
      diContainer: diContainer,
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp.router(
            darkTheme: AppTheme.dark,
            theme: AppTheme.light,
            themeMode: state.themeMode,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,

              ...AuthLocalizationConfig.delegates,
            ],
            locale: state.locale,
            supportedLocales: const [
              ...AuthLocalizations.supportedLocales,
            ],
            routerConfig: router.config(
              includePrefixMatches: true,
              // deepLinkBuilder: (deepLink) => DeepLink.path('/settings'),
              reevaluateListenable:
                  context.di.scopes.authScopeHolder.scope!.authManager,
              navigatorObservers: diContainer.navigatorObservers,
            ),
            builder: (context, child) =>
                App(child: child ?? const SizedBox.shrink()),
          );
        },
      ),
    );
  }
}
