import 'package:auth/src/_src.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class PinCodeEnterForm extends StatefulWidget {
  const PinCodeEnterForm({
    super.key,
    this.message,
    this.pinCodeLength = 4,
    this.useBiometric = false,
    this.onComplete,
    this.onBiometricPressed,
    this.onPressedReset,
    this.isFace = true,
    this.isLoading = false,
  });

  final String? message;

  final int pinCodeLength;

  final bool useBiometric;

  final bool isFace;

  final Future<void> Function(String)? onComplete;

  final VoidCallback? onBiometricPressed;

  final VoidCallback? onPressedReset;

  final bool isLoading;

  @override
  State<PinCodeEnterForm> createState() => _PinCodeEnterFormState();
}

class _PinCodeEnterFormState extends State<PinCodeEnterForm> {
  String code = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: PinCodeHeader(
            hasPinCode: true,
            hasTemporaryCode: false,
            hasError: false,
            pinCodeLength: widget.pinCodeLength,
            pinFilledCodeLength: code.length,
            isLoading: false,
          ),
        ),
        Text(
          widget.message ?? '',
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
        Opacity(
          opacity: widget.isLoading ? 1 : 0,
          child: const UiProgressIndicator(),
        ),
        Expanded(
          flex: 2,
          child: PinCodeKeyboard(
            useBiometric: widget.useBiometric,
            onPressedNumber: widget.message == null ? onPressedNumber : null,
            onReset: onPressedReset,
            onDelete: code.isNotEmpty ? onPressedDelete : null,
            onBiometricPressed: onBiometricPressed,
            reset: context.authLocalizations.reset,
            icon: widget.isFace
                ? const Icon(Icons.fingerprint)
                : const Icon(Icons.fingerprint),
          ),
        ),
      ],
    );
  }

  Future<void> onPressedNumber(String text) async {
    if (widget.isLoading) {
      return;
    }

    setState(() {
      code = '$code$text';
    });

    if (code.length == widget.pinCodeLength) {
      await widget.onComplete?.call(code);

      onPressedReset();
    }
  }

  void onPressedDelete() {
    if (code.isEmpty || widget.isLoading) {
      return;
    }

    setState(() {
      code = code.substring(0, code.length - 1);
    });
  }

  void onPressedReset() {
    if (widget.isLoading) {
      return;
    }

    if (code.isEmpty) {
      widget.onPressedReset?.call();

      return;
    }

    if (mounted) {
      setState(() {
        code = '';
      });
    }
  }

  void onBiometricPressed() {
    if (widget.isLoading) {
      return;
    }

    widget.onBiometricPressed?.call();
  }
}
