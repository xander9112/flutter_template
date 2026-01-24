import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz/features/debug/_debug.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_cubit.freezed.dart';
part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({required IDebugService debugService})
    : _debugService = debugService,
      super(SettingsState());

  late final SharedPreferences _preferences;

  final IDebugService _debugService;

  Future<void> init() async {
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
  }

  void changeTheme(ThemeMode value) {
    _preferences.setString('theme_mode', value.name);

    emit(state.copyWith(themeMode: value));
  }

  Future<void> initSettingsFromServer() async {
    await Future.delayed(Duration(seconds: 3));

    // emit(state.copyWith(isWork: true));
  }

  void changeWorkStatus() {
    emit(state.copyWith(isWork: !state.isWork));
  }
}
