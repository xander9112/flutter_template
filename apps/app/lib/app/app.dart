import 'package:app/app/_app.dart';
import 'package:app/features/main/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

class App extends StatefulWidget {
  const App({required this.child, super.key});

  final Widget child;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AppScopeHolder? _scopeHolder;

  @override
  void didChangeDependencies() {
    _scopeHolder ??= AppScopeHolder(
      authScope: context.di.scopes.authScopeHolder.scope!,
      settingsScope: context.di.scopes.settingsScopeHolder.scope!,
      debugService: context.di.debugService,
    )..create();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_scopeHolder == null) {
      return const SizedBox.shrink();
    }

    return ScopeProvider<AppScope>(
      holder: _scopeHolder!,
      child: ScopeBuilder<AppScope>.withPlaceholder(
        placeholder: const SplashScreen(),
        builder: (context, scope) {
          return widget.child;
        },
      ),
    );
  }
}
