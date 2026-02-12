import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class UiPasswordField extends StatefulWidget {
  const UiPasswordField({
    super.key,
    this.formControl,
    this.formControlName,
    this.label,
    this.onSubmitted,
  });

  final FormControl<String>? formControl;
  final String? formControlName;

  final void Function(FormControl<String>)? onSubmitted;

  final Widget? label;

  @override
  State<UiPasswordField> createState() => _UiPasswordFieldState();
}

class _UiPasswordFieldState extends State<UiPasswordField> {
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
  }

  void _toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return UiInputField<String>(
      formControl: widget.formControl,
      formControlName: widget.formControlName,
      label: widget.label,
      obscureText: obscureText,
      onSubmitted: widget.onSubmitted,
      suffix: GestureDetector(
        onTap: _toggleObscureText,
        child: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
      ),
    );
  }
}
