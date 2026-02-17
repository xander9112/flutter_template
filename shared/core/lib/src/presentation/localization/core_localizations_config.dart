import 'package:core/src/presentation/localization/core_localizations.dart';
import 'package:flutter/widgets.dart';

class CoreLocalizationConfig {
  static const List<LocalizationsDelegate<CoreLocalizations>> delegates = [
    CoreLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales =
      CoreLocalizations.supportedLocales;
}
