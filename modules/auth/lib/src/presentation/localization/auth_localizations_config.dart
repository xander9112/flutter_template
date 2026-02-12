import 'package:auth/auth.dart';
import 'package:flutter/widgets.dart';

class AuthLocalizationConfig {
  static const List<LocalizationsDelegate<AuthLocalizations>> delegates = [
    AuthLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales =
      AuthLocalizations.supportedLocales;
}
