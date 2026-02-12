import 'package:app/app/di/di_container.dart';
import 'package:app/features/settings/di/settings_scope.dart';
import 'package:app/features/settings/presentation/states/settings/settings_cubit.dart';
import 'package:app/features/update/domain/state/cubit/update_cubit.dart';
import 'package:auth/auth.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final class AppProviders extends StatelessWidget {
  const AppProviders({
    required this.child,
    required this.diContainer,
    super.key,
  });

  final Widget child;

  final DiContainer diContainer;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: diContainer),
        // TODO Вынести в отдельный scope
        BlocProvider(
          create: (_) => UpdateCubit(diContainer.repositories.updateRepository),
        ),
      ],
      child: ScopeProvider<AuthScope>(
        holder: diContainer.scopes.authScopeHolder,
        child: ScopeProvider<SettingsScope>(
          holder: diContainer.scopes.settingsScopeHolder,
          child: ScopeBuilder<SettingsScope>.withPlaceholder(
            builder: (context, scope) {
              return BlocProvider<SettingsCubit>(
                create: (context) => scope.settingsCubit,
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}
