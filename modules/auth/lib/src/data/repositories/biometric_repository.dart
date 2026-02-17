import 'package:auth/src/_src.dart';
import 'package:flutter/foundation.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

class BiometricRepository implements IBiometricRepository {
  BiometricRepository({required AuthStorage authStorage})
    : _authStorage = authStorage;

  final AuthStorage _authStorage;

  LocalAuthentication get localAuth => LocalAuthentication();

  @override
  Future<bool> get isAvailable {
    if (!kIsWeb) {
      return localAuth.canCheckBiometrics;
    }

    return Future<bool>.value(false);
  }

  @override
  Future<bool> get isBiometricSupport async {
    try {
      return await isAvailable && await isDeviceSupported;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> get isDeviceSupported => localAuth.isDeviceSupported();

  @override
  Future<bool> authenticate({
    required String localizedReason,
    Iterable<AuthMessages> authMessages = const <AuthMessages>[
      IOSAuthMessages(),
      AndroidAuthMessages(),
    ],
  }) async {
    try {
      await localAuth.stopAuthentication();

      return await localAuth.authenticate(
        localizedReason: localizedReason,
        authMessages: authMessages,
      );
    } catch (_) {
      return false;
    }
  }

  @override
  Future<List<BiometricTypeModel>> get getAvailableBiometrics async {
    try {
      final availableTypes = await localAuth.getAvailableBiometrics();

      return availableTypes.map((e) {
        switch (e) {
          case BiometricType.face:
            return BiometricTypeModel.face;
          case BiometricType.fingerprint:
            return BiometricTypeModel.fingerprint;
          case BiometricType.iris:
            return BiometricTypeModel.iris;
          case BiometricType.strong:
            return BiometricTypeModel.strong;
          case BiometricType.weak:
            return BiometricTypeModel.weak;
        }
      }).toList();
    } catch (_) {
      return <BiometricTypeModel>[];
    }
  }

  @override
  Future<BiometricSupportModel> getBiometricModel() async {
    var status = BiometricStatus.installed;

    BiometricTypeModel? type;

    final available = await isAvailable;

    if (!available) {
      status = BiometricStatus.notAvailable;
    }

    final availableBiometrics = await getAvailableBiometrics;

    if (availableBiometrics.isEmpty) {
      status = BiometricStatus.notAvailable;
    } else {
      status = BiometricStatus.available;

      if (availableBiometrics.contains(BiometricTypeModel.face)) {
        type = BiometricTypeModel.face;
      } else {
        type = BiometricTypeModel.fingerprint;
      }
    }

    return BiometricSupportModel(
      status: status,
      useBiometric: await _authStorage.useBiometric ?? false,
      type: type,
    );
  }

  @override
  Future<bool?> onInitBiometric({
    required String localizedReason,
    Iterable<AuthMessages> authMessages = const <AuthMessages>[
      IOSAuthMessages(),
      AndroidAuthMessages(),
    ],
  }) async {
    if (!(await isAvailable)) {
      return null;
    }

    if ((await getAvailableBiometrics).isEmpty) {
      return null;
    }

    final didAuthenticate = await authenticate(
      localizedReason: localizedReason,
      authMessages: authMessages,
    );

    return didAuthenticate;
  }

  @override
  Future<void> setUseBiometric({required bool value}) {
    return _authStorage.setUseBiometric(value);
  }

  @override
  Future<void> deleteUseBiometric() {
    return _authStorage.removeUseBiometric();
  }
}
