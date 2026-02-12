import 'package:i_app_services/i_app_services.dart';

class UserStorage {
  UserStorage({required ISecureStorage storage}) : _storage = storage;

  final ISecureStorage _storage;

  final String _currentUserKey = 'current_user';
  final String _onboarding = 'onboarding';

  Future<void> saveCurrentUser(String value) {
    return _storage.write(_currentUserKey, value);
  }

  Future<String?> getCurrentUser() async {
    return _storage.read(_currentUserKey);
  }

  Future<void> removeCurrentUser() async {
    return _storage.delete(_currentUserKey);
  }

  Future<void> resetOnboarding() async {
    return _storage.delete(_onboarding);
  }

  Future<void> finishOnboarding({bool isFinish = true}) async {
    return _storage.write(_onboarding, isFinish.toString());
  }

  Future<bool> watchedOnboarding() async {
    final onboarding = await _storage.read(_onboarding);

    return onboarding == 'true';
  }
}
