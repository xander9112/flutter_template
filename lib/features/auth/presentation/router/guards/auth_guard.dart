import 'package:auto_route/auto_route.dart';
import 'package:quiz/app/_app.dart';
import 'package:quiz/features/auth/_auth.dart';

class AuthGuard extends AutoRouteGuard {
  final IAuthManager<UserEntity> authManager;

  AuthGuard(this.authManager, {this.isAuthRequired = true});

  final bool isAuthRequired;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (!isAuthRequired) {
      return resolver.next();
    }

    if (authManager.authStatus.value.isBlocked) {
      router.replace(NoAccessRoute());

      return;
    }

    if (authManager.onboardingStatus.value.isNotCompleted) {
      router.replace(OnboardingRoute());

      return;
    }

    if (authManager.authStatus.value.isUnauthenticated) {
      router.replace(SignInRoute());
      return;
    }

    if (authManager.lockStatus.value.isLocked) {
      router.replace(VerifyRoute());
      return;
    }

    resolver.next();
    router.removeLast();
  }
}
