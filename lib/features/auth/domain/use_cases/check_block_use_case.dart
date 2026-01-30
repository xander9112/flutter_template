import 'package:quiz/core/_core.dart';
import 'package:quiz/features/auth/_auth.dart';

class CheckBlockUseCase implements UseCaseNoParams<Duration> {
  CheckBlockUseCase(this._authManager);

  final IAuthManager<UserEntity> _authManager;

  @override
  Future<Duration> call() async {
    return Duration(seconds: _authManager.remainingSeconds);
  }
}
