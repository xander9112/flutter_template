import 'package:auto_route/auto_route.dart';
import 'package:quiz/features/auth/domain/auth_manager.dart';
import 'package:quiz/navigation/app_router.gr.dart';

class RootGuard extends AutoRouteGuard {
  final AuthManager auth;

  RootGuard(this.auth);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (auth.stage.value != AuthStage.authenticated) {
      // сохраняем intent

      auth.savePending(resolver.pendingRoutes);
    }

    switch (auth.stage.value) {
      case AuthStage.onboarding:
        router.replace(OnboardingRoute());
        break;

      case AuthStage.unauthenticated:
        router.replace(SignInRoute());
        break;

      case AuthStage.locked:
        router.replace(VerifyRoute());
        break;

      case AuthStage.authenticated:
        resolver.next();
        router.removeLast();
        break;
      default:
    }
  }
}
