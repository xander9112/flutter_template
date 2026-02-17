import 'package:auth/src/_src.dart';
import 'package:core/core.dart';

class CheckLocalAuthUseCase implements UseCaseNoParams<LocalAuthResult> {
  CheckLocalAuthUseCase(this._authManager);

  final IAuthManager<UserEntity> _authManager;
  @override
  Future<LocalAuthResult> call() async {
    if (!_authManager.settings.useLocalAuth) {
      return LocalAuthResult.notAvailable;
    }

    if (!await _authManager.hasPinCode) {
      return LocalAuthResult.notInitialized;
    }

    return LocalAuthResult.locked;
  }
}
