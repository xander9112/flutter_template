import 'package:i_app_services/i_app_services.dart';

class AuthStorage {
  AuthStorage({required ISecureStorage storage}) : _storage = storage;

  final ISecureStorage _storage;

  final String _tokenKey = 'token';
  final String _refreshTokenKey = 'refreshToken';
  final String _pinCodeKey = 'pinCode';
  final String _useBiometricKey = 'use_biometric';
  final String _useLocalAuthKey = 'use_local_auth';
  final String _blockUserDurationKey = 'block_user_duration';

  Future<bool> get hasToken => _storage.containsKey(_tokenKey);

  Future<bool> get hasRefreshToken => _storage.containsKey(_refreshTokenKey);

  Future<void> setToken(String value) {
    return _storage.write(_tokenKey, value);
  }

  Future<void> setRefreshToken(String value) {
    return _storage.write(_refreshTokenKey, value);
  }

  Future<void> removeToken() {
    return _storage.delete(_tokenKey);
  }

  Future<String?> getToken() {
    return _storage.read(_tokenKey);
  }

  Future<String?> getRefreshToken() {
    return _storage.read(_refreshTokenKey);
  }

  Future<void> deleteRefreshToken() {
    return _storage.delete(_refreshTokenKey);
  }

  Future<void> blockUser(DateTime value) {
    return _storage.write(_blockUserDurationKey, value.toString());
  }

  Future<void> unBlockUser() {
    return _storage.delete(_blockUserDurationKey);
  }

  Future<DateTime?> getBlockTime() async {
    final String? value = await _storage.read(_blockUserDurationKey);

    if (value == null) {
      return null;
    }

    return DateTime.tryParse(value);
  }

  Future<bool> get hasPinCode => _storage.containsKey(_pinCodeKey);

  Future<bool?> get useBiometric async {
    final useBiometric = await _storage.read(_useBiometricKey);

    if (useBiometric != null && useBiometric.isNotEmpty) {
      return useBiometric == 'true';
    }

    return null;
  }

  Future<void> setPinCode(String value) {
    return _storage.write(_pinCodeKey, value);
  }

  Future<void> removePinCode() {
    return _storage.delete(_pinCodeKey);
  }

  Future<bool> comparePinCode(String value) async {
    final pinCode = await _storage.read(_pinCodeKey);

    return pinCode == value;
  }

  Future<void> removeUseBiometric() {
    return _storage.delete(_useBiometricKey);
  }

  Future<void> setUseBiometric(bool value) {
    return _storage.write(_useBiometricKey, value.toString());
  }

  Future<void> setUseLocalAuth(bool value) {
    return _storage.write(_useLocalAuthKey, value.toString());
  }

  Future<bool> get useLocalAuth async {
    final useLocalAuth = await _storage.read(_useLocalAuthKey);

    if (useLocalAuth != null && useLocalAuth.isNotEmpty) {
      return useLocalAuth == 'true';
    }

    return true;
  }

  Future<void> removeUseLocalAuth() {
    return _storage.delete(_useLocalAuthKey);
  }
}
