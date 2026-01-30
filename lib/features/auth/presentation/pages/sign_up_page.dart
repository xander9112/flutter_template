import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quiz/features/auth/di/auth_scope.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SignUp')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScopeProvider.of<AuthScope>(
              context,
            )?.authManager.signUp('demo', 'demo');
          },
          child: Text('Sign In'),
        ),
      ),
    );
  }
}
