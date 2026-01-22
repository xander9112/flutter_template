import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiz/features/debug/i_debug_service.dart';
import 'package:quiz/router/app_auto_router.dart';

/// {@template app_router}
///  AppRouter - класс для управления навигацией в приложении
///  [createRouter] - метод для создания экземпляра GoRouter
/// {@endtemplate}
class AppRouter {
  /// {@macro app_router}
  const AppRouter();

  /// Ключ для доступа к корневому навигатору приложения
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  /// Начальный роут приложения
  static String get initialLocation => '/main';

  /// Метод для создания экземпляра GoRouter
  static RootStackRouter createRouter(IDebugService debugService) {
    return AppAutoRouter();

    // GoRouter(
    //   navigatorKey: rootNavigatorKey,
    //   initialLocation: initialLocation,
    //   observers: [debugService.routeObserver],
    //   routes: [
    //     StatefulShellRoute.indexedStack(
    //       parentNavigatorKey: rootNavigatorKey,
    //       builder: (context, state, navigationShell) =>
    //           RootScreen(navigationShell: navigationShell),
    //       branches: [
    //         MainRoutes.buildShellBranch(),
    //         ProfileRoutes.buildShellBranch(),
    //       ],
    //     ),
    //     DebugRoutes.buildRoutes(),
    //     UpdateRoutes.buildRoutes(),
    //   ],
    // );
  }
}
