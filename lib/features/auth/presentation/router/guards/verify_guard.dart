// import 'package:auto_route/auto_route.dart';
// import 'package:quiz/features/_features.dart';
// import 'package:quiz/router/app_auto_router.gr.dart';

// class VerifiedGuard extends AutoRouteGuard {
//   final AuthManager _authManager;

//   VerifiedGuard({required AuthManager authManager})
//     : _authManager = authManager;

//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     if (_authManager.isVerified) {
//       resolver.next();
//     } else {
//       _authManager.pendingPath ??= router.currentPath;
//       resolver.redirectUntil(VerifyRoute(onResult: resolver.next));
//     }
//   }
// }
