import 'package:app/app/theme/app_colors_scheme.dart';
import 'package:flutter/material.dart';

/// Класс для конфигурации светлой/темной темы приложения
abstract class AppTheme {
  /// Геттер для получения светлой темы
  static ThemeData get light => ThemeData.light().copyWith(
    extensions: <ThemeExtension<Object?>>[AppColors.light],
  );

  /// Геттер для получения темной темы
  static ThemeData get dark => ThemeData.dark().copyWith(
    extensions: <ThemeExtension<Object?>>[AppColors.dark],
  );
}
