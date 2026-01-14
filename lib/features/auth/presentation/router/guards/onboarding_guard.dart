// import 'package:auto_route/auto_route.dart';
// import 'package:quiz/features/_features.dart';
// import 'package:quiz/navigation/app_router.gr.dart';

// class OnboardingGuard extends AutoRouteGuard {
//   final AuthManager _authManager;

//   OnboardingGuard({required AuthManager authManager})
//     : _authManager = authManager;

//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     if (_authManager.isShowOnboarding) {
//       resolver.next(true);
//     } else {
//       _authManager.pendingPath ??= router.currentPath;

//       resolver.redirectUntil(OnboardingRoute(onResult: resolver.next));
//     }
//   }
// }
