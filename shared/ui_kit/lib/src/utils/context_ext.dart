import 'package:flutter/material.dart';
import 'package:ui_kit/src/localization/ui_kit_localizations.dart';

/// Класс, реализующий расширение для контекста приложения
extension UiKitContextExt on BuildContext {
  UiKitLocalizations get uiKitLocalizations => UiKitLocalizations.of(this)!;
}
