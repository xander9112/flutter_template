import 'package:app/features/debug/_debug.dart';
import 'package:app/features/main/presentation/screens/home_page.dart';
import 'package:app/features/main/presentation/screens/main_detail_screen.dart';
import 'package:app/features/main/presentation/screens/main_screen.dart';
import 'package:app/features/profile/presentation/screens/profile_screen.dart';
import 'package:app/features/root/root_screen.dart';
import 'package:app/features/settings/_settings.dart';
import 'package:app/features/update/presentation/screens/hard_update_screen.dart';
import 'package:auth/auth.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

part 'app_router.gr.dart';

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

final AuthRouter _authRouter = AuthRouter();

@AutoRouterConfig(replaceInRouteName: 'Flow|Page|Screen,Route')
class AppAutoRouter extends RootStackRouter {
  AppAutoRouter({
    required IAuthManager<UserEntity> authManager,
    this.isAuthRequired = true,
  }) : _authManager = authManager;
  final IAuthManager<UserEntity> _authManager;

  final bool isAuthRequired;

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    CustomRoute<void>(
      path: '/',
      transitionsBuilder: TransitionsBuilders.noTransition,
      page: MainRoute.page,
      initial: true,
      guards: [AuthGuard(_authManager, isAuthRequired: isAuthRequired)],
      children: [
        CustomRoute<void>(
          path: 'home',
          transitionsBuilder: TransitionsBuilders.noTransition,
          page: HomeRoute.page,
          initial: true,
        ),
        CustomRoute<void>(
          path: 'profile',
          page: ProfileRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
      ],
    ),

    AutoRoute(path: '/settings', page: SettingsRoute.page),
    ..._authRouter.routes,
    ...debugRoutes,

    RedirectRoute(path: '/auth', redirectTo: '/'),

    RedirectRoute(path: '/auth/*', redirectTo: '/'),

    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}
