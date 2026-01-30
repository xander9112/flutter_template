// import 'package:dartz/dartz.dart';
// import 'package:quiz/core/_core.dart';
// import 'package:quiz/features/auth/_auth.dart';
// import 'package:quiz/features/debug/failure.dart';

// class CheckLocalAuthUseCase
//     implements UseCaseNoParams<Either<Failure, LocalAuthResult>> {
//   CheckLocalAuthUseCase(this._authManager);

//   final IAuthManager<UserEntity> _authManager;

//   @override
//   Future<Either<Failure, LocalAuthResult>> call() async {
//     if (!_authManager.settings.useLocalAuth) {
//       return const Right(LocalAuthResult.notAvailable);
//     }

//     // if (!await _authManager.hasPinCode) {
//     //   return const Right(LocalAuthResult.notInitialized);
//     // }

//     // if (_authManager.locked) {
//     //   return const Right(LocalAuthResult.locked);
//     // } else {
//     //   return const Right(LocalAuthResult.unlocked);
//     // }
//   }
// }
