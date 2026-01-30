import 'package:flutter/material.dart';
import 'package:quiz/ui_kit/lib/ui_kit.dart';

ThemeData createLightTheme() {
  final colors = LightThemeColors();

  final colorScheme = ColorScheme.light(primary: colors.primary);

  return ThemeData.light(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
    snackBarTheme: SnackBarThemeData(backgroundColor: colorScheme.surface),
    colorScheme: colorScheme,
    extensions: <ThemeExtension<dynamic>>[
      TextExtension(
        displayLarge: TextStyles.displayLarge.copyWith(color: colors.colorText),
        displayMedium: TextStyles.displayMedium.copyWith(
          color: colors.colorText,
        ),
        displaySmall: TextStyles.displaySmall.copyWith(color: colors.colorText),
        headlineMedium: TextStyles.headlineMedium.copyWith(
          color: colors.colorText,
        ),
        headlineSmall: TextStyles.headlineSmall.copyWith(
          color: colors.colorText,
        ),
        titleLarge: TextStyles.titleLarge.copyWith(color: colors.colorText),
        titleMedium: TextStyles.titleMedium.copyWith(color: colors.colorText),
        titleSmall: TextStyles.titleSmall.copyWith(color: colors.colorText),
        bodyLarge: TextStyles.bodyLarge.copyWith(color: colors.colorText),
        bodyMedium: TextStyles.bodyMedium.copyWith(color: colors.colorText),
        labelLarge: TextStyles.labelLarge.copyWith(color: colors.colorText),
        bodySmall: TextStyles.bodySmall.copyWith(color: colors.colorText),
        labelSmall: TextStyles.labelSmall.copyWith(color: colors.colorText),
      ),
    ],
  );
}
