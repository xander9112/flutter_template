import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quiz/features/auth/di/auth_scope.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, this.onResult});

  final VoidCallback? onResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Onboarding')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScopeProvider.of<AuthScope>(
              context,
            )?.authManager.finishOnboarding();
          },
          child: Text('Пропустить'),
        ),
      ),
    );
  }
}
