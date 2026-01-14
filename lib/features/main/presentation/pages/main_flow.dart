import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainFlow extends StatelessWidget implements AutoRouteWrapper {
  const MainFlow({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: AutoRouter());
  }
}
