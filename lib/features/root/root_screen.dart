import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('ROOT route');
    return Scaffold(body: Center(child: Text('ROOT'))); // AutoRouter();
  }
}
