import 'package:flutter/material.dart';

class UiButton extends StatelessWidget {
  const UiButton({required this.onPressed, required this.child, super.key});

  final VoidCallback? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
