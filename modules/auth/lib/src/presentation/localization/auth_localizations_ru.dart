// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'auth_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AuthLocalizationsRu extends AuthLocalizations {
  AuthLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get signInTitle => 'Войти';

  @override
  String get signUpTitle => 'Зарегистрироваться';

  @override
  String get login => 'Логин';

  @override
  String get password => 'Пароль';

  @override
  String pinCodeError(String error) {
    String _temp0 = intl.Intl.selectLogic(
      error,
      {
        'PIN_CODE_NOT_CORRECT': 'Неверный PIN-код',
        'PIN_CODE_ATTEMPTS_ENDED': 'Превышено количество попыток',
        'PIN_CODE_NOT_CONFIRMED': 'PIN-код не подтвержден',
        'other': 'Неизвестная ошибка',
      },
    );
    return '$_temp0';
  }

  @override
  String get enterPinCode => 'Введите PIN-код';

  @override
  String get repeatPinCode => 'Повторите PIN-код';

  @override
  String get settingPinCode => 'Настроить PIN-код';

  @override
  String get reset => 'Сбросить';

  @override
  String get resetTitle => 'Вы уверены?';

  @override
  String get resetDescription =>
      'После сброса PIN-кода, вам нужно будет авторизоваться.';

  @override
  String get useBiometricsToLogin => 'Использовать биометрию?';

  @override
  String get localizedReason => 'Подтвердите личность для продолжения';

  @override
  String get biometrySignInTitle => 'Подтверждение входа';

  @override
  String get biometrySignInHint => 'Подтвердите личность с помощью биометрии';

  @override
  String get biometryCancelButton => 'Отмена';

  @override
  String get biometryLocalizedFallbackTitle => 'Ввести пароль';
}
