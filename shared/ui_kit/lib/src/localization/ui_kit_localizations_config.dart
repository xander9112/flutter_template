import 'package:flutter/widgets.dart';
import 'package:ui_kit/src/localization/ui_kit_localizations.dart';

class UiKitLocalizationConfig {
  static const List<LocalizationsDelegate<UiKitLocalizations>> delegates = [
    UiKitLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales =
      UiKitLocalizations.supportedLocales;
}
