import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Splash App'),
            UiProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
