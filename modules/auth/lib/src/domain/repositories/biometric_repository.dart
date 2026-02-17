import 'package:auth/src/_src.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

abstract interface class IBiometricRepository {
  Future<List<BiometricTypeModel>> get getAvailableBiometrics;

  Future<bool> get isAvailable;

  Future<bool> get isDeviceSupported;

  Future<bool> get isBiometricSupport;

  Future<bool> authenticate({
    required String localizedReason,
    Iterable<AuthMessages> authMessages = const <AuthMessages>[
      IOSAuthMessages(),
      AndroidAuthMessages(),
    ],
  });

  Future<bool?> onInitBiometric({
    required String localizedReason,
    Iterable<AuthMessages> authMessages = const <AuthMessages>[
      IOSAuthMessages(),
      AndroidAuthMessages(),
    ],
  });

  Future<BiometricSupportModel> getBiometricModel();

  Future<void> setUseBiometric({required bool value});

  Future<void> deleteUseBiometric();
}
