import 'package:auth/auth.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

/// Класс, реализующий расширение для контекста приложения
extension AuthContextExt on BuildContext {
  /// Метод для получения экземпляра AuthScope
  AuthScope get authScope => ScopeProvider.of<AuthScope>(this, listen: false)!;

  AuthLocalizations get authLocalizations => AuthLocalizations.of(this)!;
}
