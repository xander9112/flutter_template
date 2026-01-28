import 'package:auto_route/auto_route.dart';
import 'package:quiz/features/auth/domain/auth_manager.dart';
import 'package:quiz/features/auth/presentation/router/guards/auth_guard.dart';
import 'package:quiz/features/auth/presentation/router/router.dart';
import 'package:quiz/features/debug/router/router.dart';
import 'package:quiz/router/app_auto_router.gr.dart';

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
