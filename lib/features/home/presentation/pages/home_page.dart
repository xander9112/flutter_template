import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quiz/features/_features.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScopeBuilder<AuthScope>.withPlaceholder(
              builder: (context, scope) {
                return Text('isAuth: ${scope.authManager.stage.value.name}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
