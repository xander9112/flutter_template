import 'package:auto_route/auto_route.dart';
import 'package:quiz/router/app_auto_router.gr.dart';

final authRoutes = [
  CustomRoute(
    transitionsBuilder: TransitionsBuilders.noTransition,
    path: '/auth',
    page: AuthRoute.page,
    children: [
      CustomRoute(
        transitionsBuilder: TransitionsBuilders.noTransition,
        path: 'sign-in',
        page: SignInRoute.page,
        initial: true,
      ),
      CustomRoute(
        transitionsBuilder: TransitionsBuilders.noTransition,
        path: 'sign-up',
        page: SignUpRoute.page,
      ),

      CustomRoute(
        transitionsBuilder: TransitionsBuilders.noTransition,
        path: 'pin',
        page: VerifyRoute.page,
      ),
      CustomRoute(
        transitionsBuilder: TransitionsBuilders.noTransition,
        path: 'onboarding',
        page: OnboardingRoute.page,
      ),
    ],
  ),
];
