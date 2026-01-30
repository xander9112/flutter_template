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
    IAuthManager<UserEntity> authManager, {
    bool isAuthRequired = true,
  }) {
    return AppAutoRouter(
      authManager: authManager,
      isAuthRequired: isAuthRequired,
    );
  }
}

@AutoRouterConfig(replaceInRouteName: 'Flow|Page|Screen,Route')
class AppAutoRouter extends RootStackRouter {
  final IAuthManager<UserEntity> _authManager;

  AppAutoRouter({
    required IAuthManager<UserEntity> authManager,
    this.isAuthRequired = true,
  }) : _authManager = authManager;

  final bool isAuthRequired;

  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    CustomRoute(
      path: '/',
      transitionsBuilder: TransitionsBuilders.noTransition,
      page: MainRoute.page,
      initial: true,
      guards: [AuthGuard(_authManager, isAuthRequired: isAuthRequired)],
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

    CustomRoute(
      page: NoAccessRoute.page,
      path: '/no-access',
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),

    RedirectRoute(path: '/auth', redirectTo: '/'),

    RedirectRoute(path: '/auth/*', redirectTo: '/'),

    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}
