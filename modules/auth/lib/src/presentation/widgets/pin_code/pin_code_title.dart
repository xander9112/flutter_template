import 'package:auth/src/_src.dart';
import 'package:flutter/material.dart';

class PinCodeTitle extends StatelessWidget {
  const PinCodeTitle({
    required this.hasPinCode,
    required this.hasTemporaryCode,
    this.isChanging = false,
    super.key,
  });

  final bool hasPinCode;
  final bool hasTemporaryCode;
  final bool isChanging;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleMedium;

    if (hasPinCode) {
      return Text(context.authLocalizations.enterPinCode, style: style);
    }

    if (hasTemporaryCode) {
      return Text(context.authLocalizations.repeatPinCode, style: style);
    }

    return Text(context.authLocalizations.settingPinCode, style: style);
  }
}
