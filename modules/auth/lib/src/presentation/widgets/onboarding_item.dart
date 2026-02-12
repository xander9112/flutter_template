import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class UiOnboardingItem extends StatelessWidget {
  const UiOnboardingItem({
    required this.btnTitle,
    required this.description,
    required this.onPressed,
    required this.title,
    super.key,
  });

  final String title;
  final String description;
  final String btnTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiButton(
              onPressed: onPressed,
              child: Text(btnTitle),
            ),
          ],
        ),
      ],
    );
  }
}
