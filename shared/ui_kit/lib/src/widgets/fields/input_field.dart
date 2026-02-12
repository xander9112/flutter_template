import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class UiInputField<T> extends StatelessWidget {
  const UiInputField({
    super.key,
    this.formControl,
    this.formControlName,
    this.label,
    this.suffix,
    this.obscureText = false,
    this.onSubmitted,
  });

  final FormControl<T>? formControl;
  final String? formControlName;

  final void Function(FormControl<T>)? onSubmitted;

  final Widget? label;
  final Widget? suffix;

  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Insets.s),
      child: ReactiveTextField<T>(
        formControl: formControl,
        formControlName: formControlName,
        obscureText: obscureText,
        decoration: InputDecoration(label: label, suffix: suffix),
        onSubmitted: onSubmitted,
      ),
    );
  }
}
