import 'package:auto_route/auto_route.dart';
import 'package:quiz/navigation/transitions/_transitions.dart';
import 'package:quiz/router/app_auto_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Flow|Page|Screen,Route')
class AppAutoRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    CustomRoute(
      path: '/',
      page: TabsWrapperRoute.page,
      transitionsBuilder: TransitionsBuilders.noTransition,
      initial: true,
      children: [
        CustomRoute(
          path: 'home',
          transitionsBuilder: TransitionsBuilders.noTransition,
          page: HomeRoute.page,
          initial: true,
        ),
        CustomRoute(
          path: 'profile',
          page: ProfileRootRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
          children: [
            CustomRoute(
              path: '',
              transitionsBuilder: TransitionsBuilders.noTransition,
              page: ProfileRoute.page,
              initial: true,
            ),
            _profileRoutes,
            ..._settingsRoutes,
          ],
        ),
      ],
    ),

    /// Редирект на корень, чтобы не застрять на экранах авторизации
    RedirectRoute(path: '/auth', redirectTo: '/'),
    RedirectRoute(path: '/auth/*', redirectTo: '/'),

    CustomRoute(
      transitionsBuilder: TransitionsBuilders.noTransition,
      path: '/auth',
      page: AuthRoute.page,
      children: [
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.noTransition,
          path: 'login',
          page: SignInRoute.page,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.noTransition,
          path: 'register',
          page: SignUpRoute.page,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.noTransition,
          path: 'onboarding',
          page: OnboardingRoute.page,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.noTransition,
          path: 'pin',
          page: VerifyRoute.page,
        ),
      ],
    ),

    /// NO ACCESS
    CustomRoute(
      page: NoAccessRoute.page,
      path: '/no-access',
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),

    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}

final _profileRoutes = CustomRoute(
  page: ProfileDataRootRoute.page,
  path: '',
  customRouteBuilder: modalBottomSheetBuilder,
  meta: {'showBottomNavBar': false},
  children: [
    CustomRoute(
      path: 'data',
      page: ProfileDataRoute.page,
      initial: true,
      meta: {'showBottomNavBar': false},
      transitionsBuilder: TransitionsBuilders.slideBottom,
    ),
    CustomRoute(
      path: 'info',
      page: ProfileInfoRoute.page,
      duration: Duration(milliseconds: 150),
      meta: {'showBottomNavBar': false},
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
    ),
  ],
);

final _settingsRoutes = [
  AutoRoute(
    path: 'settings',
    page: SettingsRoute.page,
    meta: {'showBottomNavBar': false},
  ),
];
