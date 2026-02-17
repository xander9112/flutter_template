import 'package:flutter/material.dart';

import '../presentation/localization/core_localizations.dart';

/// Класс, реализующий расширение для контекста приложения
extension CoreContextExt on BuildContext {
  /// Метод для получения экземпляра CoreScope

  CoreLocalizations get coreLocalizations => CoreLocalizations.of(this)!;
}
