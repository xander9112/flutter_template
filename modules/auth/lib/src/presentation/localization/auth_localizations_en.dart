// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'auth_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AuthLocalizationsEn extends AuthLocalizations {
  AuthLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get signInTitle => 'Sign in';

  @override
  String get signUpTitle => 'Sign up';

  @override
  String get login => 'Login';

  @override
  String get password => 'Password';

  @override
  String pinCodeError(String error) {
    String _temp0 = intl.Intl.selectLogic(
      error,
      {
        'PIN_CODE_NOT_CORRECT': 'Incorrect PIN code',
        'PIN_CODE_ATTEMPTS_ENDED': 'PIN code attempts exceeded',
        'PIN_CODE_NOT_CONFIRMED': 'PIN code not confirmed',
        'other': 'Unknown error',
      },
    );
    return '$_temp0';
  }

  @override
  String get enterPinCode => 'Enter PIN-code';

  @override
  String get repeatPinCode => 'Repeat PIN-code';

  @override
  String get settingPinCode => 'Settings PIN-code';

  @override
  String get reset => 'Reset';

  @override
  String get resetTitle => 'Are you sure?';

  @override
  String get resetDescription =>
      'After resetting the PIN-code, you will need to log in.';

  @override
  String get useBiometricsToLogin => 'Use biometrics to login?';

  @override
  String get localizedReason => 'Confirm your identity to continue';

  @override
  String get biometrySignInTitle => 'Sign in confirmation';

  @override
  String get biometrySignInHint => 'Confirm your identity using biometrics';

  @override
  String get biometryCancelButton => 'Cancel';

  @override
  String get biometryLocalizedFallbackTitle => 'Use passcode';
}
