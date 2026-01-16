import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/core/_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_cubit.freezed.dart';
part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({required AppLogger logger})
    : _logger = logger,
      super(SettingsState());

  late final SharedPreferences _preferences;

  final AppLogger _logger;

  Future<void> init() async {
    // _logger.info('SETTINGS INIT');
    _preferences = await SharedPreferences.getInstance();

    final modeStr = _preferences.getString('theme_mode');

    switch (modeStr) {
      case 'light':
        emit(state.copyWith(themeMode: ThemeMode.light));

      case 'dark':
        emit(state.copyWith(themeMode: ThemeMode.dark));

        break;
      default:
        emit(state.copyWith(themeMode: ThemeMode.system));
    }

    // _logger.info('SETTINGS READY');
  }

  void changeTheme(ThemeMode value) {
    _preferences.setString('theme_mode', value.name);

    emit(state.copyWith(themeMode: value));
  }

  Future<void> initSettingsFromServer() async {
    // _logger.info('SETTINGS FROM SERVER INIT');

    await Future.delayed(Duration(seconds: 3));

    emit(state.copyWith(isWork: true));

    // _logger.info('SETTINGS FROM SERVER READY');
  }

  void changeWorkStatus() {
    emit(state.copyWith(isWork: !state.isWork));
  }
}
