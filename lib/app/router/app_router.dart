import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiz/app/_app.dart';
import 'package:quiz/features/auth/_auth.dart';
import 'package:quiz/features/debug/i_debug_service.dart';
import 'package:quiz/features/debug/router/router.dart';

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
  static RootStackRouter createRouter(
    IDebugService debugService,
    AuthManager authManager,
  ) {
    return AppAutoRouter(authManager: authManager);
  }
}

@AutoRouterConfig(replaceInRouteName: 'Flow|Page|Screen,Route')
class AppAutoRouter extends RootStackRouter {
  final AuthManager _authManager;

  AppAutoRouter({required AuthManager authManager})
    : _authManager = authManager;

  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    CustomRoute(
      path: '/',
      transitionsBuilder: TransitionsBuilders.noTransition,
      page: MainRoute.page,
      initial: true,
      guards: [AuthGuard(_authManager)],
      children: [
        CustomRoute(
          path: 'home',
          transitionsBuilder: TransitionsBuilders.noTransition,
          page: HomeRoute.page,
          initial: true,
        ),
        CustomRoute(
          path: 'profile',
          page: ProfileRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
      ],
    ),

    AutoRoute(path: '/settings', page: SettingsRoute.page),
    ...authRoutes,
    ...debugRoutes,

    RedirectRoute(path: '/auth', redirectTo: '/'),

    RedirectRoute(path: '/auth/*', redirectTo: '/'),

    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}
