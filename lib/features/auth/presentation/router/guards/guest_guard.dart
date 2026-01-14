// import 'package:auto_route/auto_route.dart';
// import 'package:quiz/features/_features.dart';
// import 'package:quiz/navigation/app_router.gr.dart';

// class GuestGuard extends AutoRouteGuard {
//   final AuthManager auth;

//   GuestGuard(this.auth);

//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     if (auth.isAuth && auth.isVerified) {
//       router.replaceAll([const MainRoute()]);
//     } else {
//       resolver.next();
//     }
//   }
// }
