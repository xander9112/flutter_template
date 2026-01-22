/// {@template debug_routes}
///  Роуты для отладки приложения
/// [buildRoutes] - метод для создания роутов
/// {@endtemplate}
abstract final class DebugRoutes {
  /// Название экранов
  static const String debugScreenName = 'debug';
  static const String tokensScreenName = 'debug/tokens';
  static const String uiKitScreenName = 'debug/ui_kit';
  static const String iconsScreenName = 'debug/icons';
  static const String themeScreenName = 'debug/theme';
  static const String langScreenName = 'debug/lang';
  static const String componentsScreenName = 'debug/components';

  /// Пути к экранам
  static const String debugScreenPath = '/debug';
  static const String tokensScreenPath = 'debug/tokens';
  static const String uiKitScreenPath = 'debug/ui_kit';
  static const String iconsScreenPath = 'debug/icons';
  static const String themeScreenPath = 'debug/theme';
  static const String langScreenPath = 'debug/lang';
  static const String componentsScreenPath = 'debug/components';
}
