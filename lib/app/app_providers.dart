import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:quiz/app/_app.dart';
import 'package:quiz/app/theme/theme_notifier.dart';
import 'package:quiz/features/auth/_auth.dart';
import 'package:quiz/features/settings/_settings.dart';
import 'package:quiz/features/update/domain/state/cubit/update_cubit.dart';
import 'package:quiz/l10n/localization_notifier.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

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
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider(create: (_) => LocalizationNotifier()),
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
