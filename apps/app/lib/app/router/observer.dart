import 'package:app/features/debug/_debug.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class RouterObserver extends AutoRouterObserver {
  RouterObserver({required this.debugService});

  final IDebugService debugService;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugService.logDebug('New route pushed: ${route.settings.name}');
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    debugService.logDebug('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    debugService.logDebug('Tab route re-visited: ${route.name}');
  }
}
