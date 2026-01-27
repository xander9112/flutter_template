import 'package:flutter/material.dart';
import 'package:quiz/app/app_context_ext.dart';
import 'package:quiz/app/app_scope.dart';
import 'package:quiz/features/main/splash_screen.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key, required this.child});

  final Widget child;

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
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
      return SizedBox.shrink();
    }

    return ScopeProvider<AppScope>(
      holder: _scopeHolder!,
      child: ScopeBuilder<AppScope>.withPlaceholder(
        placeholder: SplashScreen(),
        builder: (context, scope) {
          return widget.child;
        },
      ),
    );
  }
}
