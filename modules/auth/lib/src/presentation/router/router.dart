import 'package:auth/src/_src.dart';
import 'package:auto_route/auto_route.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AuthRouter extends RootStackRouter {
  static String noAccessPath = '/no-access';
  static String authPath = '/auth';
  static String signInPath = 'sign-in';
  static String signUpPath = 'sign-up';
  static String verifyPath = 'verify';
  static String onboarding = 'onboarding';

  @override
  List<AutoRoute> get routes => [
    CustomRoute<void>(
      transitionsBuilder: TransitionsBuilders.noTransition,
      path: authPath,
      page: AuthRoute.page,
      children: [
        CustomRoute<void>(
          transitionsBuilder: TransitionsBuilders.noTransition,
          path: signInPath,
          page: SignInRoute.page,
          initial: true,
        ),
        CustomRoute<void>(
          transitionsBuilder: TransitionsBuilders.noTransition,
          path: signUpPath,
          page: SignUpRoute.page,
        ),

        CustomRoute<void>(
          transitionsBuilder: TransitionsBuilders.noTransition,
          path: verifyPath,
          page: VerifyRoute.page,
        ),
        CustomRoute<void>(
          transitionsBuilder: TransitionsBuilders.noTransition,
          path: onboarding,
          page: OnboardingRoute.page,
        ),
      ],
    ),

    CustomRoute<void>(
      page: NoAccessRoute.page,
      path: noAccessPath,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
  ];
}
