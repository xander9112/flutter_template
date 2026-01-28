import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quiz/features/debug/_debug.dart';

class RouterObserver extends AutoRouterObserver {
  final IDebugService debugService;

  RouterObserver({required this.debugService});

  @override
  void didPush(Route route, Route? previousRoute) {
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
