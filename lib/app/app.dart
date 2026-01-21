import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/app/_app.dart';
import 'package:quiz/features/auth/di/auth_scope.dart';
import 'package:quiz/features/settings/di/settings_scope.dart';
import 'package:quiz/features/settings/presentation/states/settings/settings_cubit.dart';
import 'package:quiz/navigation/navigation_scope.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key, required this.diContainer, required this.router});

  final RootScopeHolder diContainer;
  final RootStackRouter router;

  @override
  Widget build(BuildContext context) {
    return ScopeProvider<RootScope>(
      holder: diContainer,
      child: ScopeBuilder<RootScope>.withPlaceholder(
        builder: (context, scope) {
          return ScopeProvider<SettingsScope>(
            holder: SettingsScopeHolder(scope)..create(),
            child: ScopeBuilder<SettingsScope>.withPlaceholder(
              builder: (context, settingsScope) {
                return ScopeProvider<AuthScope>(
                  holder: AuthScopeHolder(scope)..create(),
                  child: ScopeBuilder<AuthScope>.withPlaceholder(
                    builder: (context, authScope) {
                      return ScopeProvider<NavigationScope>(
                        holder: NavigationScopeHolder(authScope)..create(),
                        child: ScopeBuilder<NavigationScope>.withPlaceholder(
                          builder: (context, navScope) {
                            return BlocProvider<SettingsCubit>.value(
                              value: settingsScope.settingsCubit,
                              child: BlocBuilder<SettingsCubit, SettingsState>(
                                builder: (context, state) {
                                  return BlocProvider<SettingsCubit>.value(
                                    value: settingsScope.settingsCubit,
                                    child: BlocBuilder<SettingsCubit, SettingsState>(
                                      builder: (context, state) {
                                        return MaterialApp.router(
                                          debugShowCheckedModeBanner: false,
                                          themeMode: state.themeMode,
                                          theme: ThemeData.light(),
                                          darkTheme: ThemeData.dark(),
                                          routerConfig: navScope.router.config(
                                            includePrefixMatches: true,
                                            reevaluateListenable:
                                                authScope.authManager,
                                            // deepLinkBuilder: (deepLink) {
                                            // return DeepLink.path('/profile/info');
                                            // },
                                          ),
                                          builder: (context, child) {
                                            return AppWrap(
                                              settingsState: state,
                                              child: child,
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
