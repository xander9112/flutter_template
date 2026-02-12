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
}
