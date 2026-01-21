import 'package:flutter/material.dart';
import 'package:quiz/app/root_scope.dart';
import 'package:yx_scope_flutter/yx_scope_flutter.dart';

/// Класс, реализующий расширение для контекста приложения
extension AppContextExt on BuildContext {
  /// Метод для получения экземпляра DIContainer
  RootScope get rootScope => ScopeProvider.of<RootScope>(this)!;

  // /// Геттер для получения темы
  // ThemeNotifier get theme => read<ThemeNotifier>();

  // /// Геттер для получения локализации
  // AppLocalizations get l10n => AppLocalizations.of(this)!;

  // /// Геттер для получения управления локализацией
  // LocalizationNotifier get localization => read<LocalizationNotifier>();
}
