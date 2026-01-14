// import 'package:auto_route/auto_route.dart';
// import 'package:quiz/features/_features.dart';
// import 'package:quiz/navigation/app_router.gr.dart';

// class AdminGuard extends AutoRouteGuard {
//   final AuthManager _authManager;

//   AdminGuard({required AuthManager authManager}) : _authManager = authManager;

//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     if (_authManager.isAdmin) {
//       resolver.next();
//       return;
//     }

//     resolver.redirectUntil(const NoAccessRoute());
//   }
// }
