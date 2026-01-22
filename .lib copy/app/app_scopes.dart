import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/app/_app.dart';
import 'package:quiz/features/_features.dart';
import 'package:quiz/navigation/navigation_scope.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

class AppScopes extends StatelessWidget {
  const AppScopes({super.key, required this.scope, required this.builder});

  final RootScope scope;

  final Widget Function(
    BuildContext context,
    SettingsState settingsState,
    NavigationScope navScope,
    AuthScope authScope,
  )
  builder;

  @override
  Widget build(BuildContext context) {
    return ScopeProvider<SettingsScope>(
      holder: scope.settingsScopeHolder,
      child: ScopeBuilder<SettingsScope>.withPlaceholder(
        builder: (context, settingsScope) {
          return ScopeProvider<AuthScope>(
            holder: scope.authScopeHolder,
            child: ScopeBuilder<AuthScope>.withPlaceholder(
              builder: (context, authScope) {
                return ScopeProvider<NavigationScope>(
                  holder: scope.navigateScopeHolder,
                  child: ScopeBuilder<NavigationScope>.withPlaceholder(
                    builder: (context, navScope) {
                      return BlocProvider<SettingsCubit>.value(
                        value: settingsScope.settingsCubit,
                        child: BlocBuilder<SettingsCubit, SettingsState>(
                          builder: (context, state) {
                            return builder(context, state, navScope, authScope);
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
