import 'dart:async';

import 'package:auth/src/_src.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController controller;

  @override
  void initState() {
    super.initState();

    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Insets.l),
          child: PageView(
            controller: controller,
            children: [
              UiOnboardingItem(
                btnTitle: 'Next',
                title: 'Demo onboarding title page 1',
                description: 'Demo onboarding description page 1',
                onPressed: () {
                  unawaited(
                    controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    ),
                  );
                },
              ),
              UiOnboardingItem(
                btnTitle: 'Next',
                title: 'Demo onboarding title page 2',
                description: 'Demo onboarding description page 2',
                onPressed: () {
                  unawaited(
                    controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    ),
                  );
                },
              ),
              UiOnboardingItem(
                btnTitle: 'Finish',
                title: 'Open app',
                description: '',
                onPressed: context.authScope.authManager.finishOnboarding,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
