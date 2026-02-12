part of 'settings_cubit.dart';

@freezed
sealed class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default(Locale('en')) Locale locale,
    @Default(false) bool isWork,
  }) = _Initial;

  const SettingsState._();
}
