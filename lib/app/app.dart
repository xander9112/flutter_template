import 'package:flutter/material.dart';
import 'package:quiz/app/_app.dart';
import 'package:quiz/app/app_scopes.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key, required this.diContainer});

  final RootScopeHolder diContainer;

  @override
  Widget build(BuildContext context) {
    return ScopeProvider<RootScope>(
      holder: diContainer,
      child: ScopeBuilder<RootScope>.withPlaceholder(
        builder: (context, scope) {
          print('BUI');
          return AppScopes(
            scope: scope,
            builder: (context, settingsState, navScope, authScope) {
              print('BUI22');
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                themeMode: settingsState.themeMode,
                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),
                routerConfig: navScope.router.config(
                  includePrefixMatches: true,
                  reevaluateListenable: authScope.authManager,
                  // deepLinkBuilder: (deepLink) {
                  // return DeepLink.path('/profile/info');
                  // },
                ),
                builder: (context, child) {
                  return AppWrap(settingsState: settingsState, child: child);
                },
              );
            },
          );
        },
      ),
    );
  }
}
