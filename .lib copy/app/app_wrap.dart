import 'package:flutter/material.dart';
import 'package:quiz/app/_app.dart';
import 'package:quiz/app/app_scope.dart';
import 'package:quiz/features/_features.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

import '../features/splash/_splash.dart';

class AppWrap extends StatefulWidget {
  const AppWrap({super.key, required this.child, required this.settingsState});

  final Widget? child;

  final SettingsState settingsState;

  @override
  State<AppWrap> createState() => _AppWrapState();
}

class _AppWrapState extends State<AppWrap> {
  late final AppScopeHolder _appScopeHolder;

  @override
  void didChangeDependencies() {
    _appScopeHolder = AppScopeHolder(
      context.rootScope,
      authScope: ScopeProvider.of<AuthScope>(context)!,
      settingsScope: ScopeProvider.of<SettingsScope>(context)!,
    );

    _appScopeHolder.create();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScopeProvider<AppScope>(
      holder: _appScopeHolder,
      child: ScopeBuilder<AppScope>.withPlaceholder(
        placeholder: SplashPage(),
        builder: (context, scope) {
          if (widget.settingsState.isWork) {
            return InWorkPage();
          }

          return widget.child ?? SizedBox.shrink();
        },
      ),
    );
  }
}
