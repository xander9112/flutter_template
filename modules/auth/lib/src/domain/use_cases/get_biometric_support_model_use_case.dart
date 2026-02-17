import 'package:auth/src/_src.dart';
import 'package:core/core.dart';

class GetBiometricSupportModel extends UseCaseNoParams<BiometricSupportModel> {
  GetBiometricSupportModel(this._authManager);

  final IAuthManager<UserEntity> _authManager;

  @override
  Future<BiometricSupportModel> call() {
    return _authManager.getBiometricSupportModel();
  }
}
