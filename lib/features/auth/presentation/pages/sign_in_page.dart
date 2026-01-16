import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quiz/features/auth/di/auth_scope.dart';
import 'package:quiz/navigation/app_router.gr.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key, this.onResult});

  final VoidCallback? onResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SignIn')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                context.router.replace(SignUpRoute());
              },
              child: Text('Sign Up'),
            ),
            ElevatedButton(
              onPressed: () {
                ScopeProvider.of<AuthScope>(context)?.authManager.signIn();
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
