import 'dart:async';

import 'package:auth/auth.dart';
import 'package:auto_route/auto_route.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard(this.authManager, {this.isAuthRequired = true});

  final IAuthManager<UserEntity> authManager;

  final bool isAuthRequired;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (!isAuthRequired) {
      return resolver.next();
    }

    if (authManager.authStatus.value.isBlocked) {
      unawaited(router.replace(const NoAccessRoute()));

      return;
    }

    if (authManager.onboardingStatus.value.isNotCompleted) {
      unawaited(router.replace(const OnboardingRoute()));

      return;
    }

    if (authManager.authStatus.value.isUnauthenticated) {
      unawaited(router.replace(const SignInRoute()));

      return;
    }

    if (authManager.lockStatus.value.isLocked) {
      unawaited(router.replace(const VerifyRoute()));

      return;
    }

    resolver.next();
    router.removeLast();
  }
}
