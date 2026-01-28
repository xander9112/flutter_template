import 'package:auto_route/auto_route.dart';
import 'package:quiz/app/_app.dart';
import 'package:quiz/features/auth/domain/auth_manager.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthManager auth;

  AuthGuard(this.auth);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (!auth.isMustLogin) {
      return resolver.next();
    }

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
    }
  }
}
