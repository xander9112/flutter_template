// import 'package:auto_route/auto_route.dart';
// import 'package:quiz/features/_features.dart';
// import 'package:quiz/router/app_auto_router.gr.dart';

// class AuthGuard extends AutoRouteGuard {
//   final AuthManager _authManager;

//   AuthGuard({required AuthManager authManager}) : _authManager = authManager;

//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     if (_authManager.isAuth) {
//       _authManager.pendingPath ??= router.currentPath;

//       resolver.next(true);
//     } else {
//       _authManager.pendingPath ??= router.currentPath;

//       resolver.redirectUntil(AuthRoute());
//     }
//   }
// }
