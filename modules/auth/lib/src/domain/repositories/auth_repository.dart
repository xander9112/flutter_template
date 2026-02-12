import 'package:auth/src/_src.dart';
import 'package:dartz/dartz.dart';

abstract interface class IAuthRepository<A, U> {
  Future<Either<AuthFailure, A>> signIn(String login, String password);

  Future<Either<AuthFailure, A>> signUp(String login, String password);

  Future<Either<AuthFailure, bool>> signOut();

  Future<void> blockUser(DateTime value);

  Future<void> unBlocUser();

  Future<DateTime?> getBlockTime();

  Future<bool> hasAccessToken();

  Future<void> setAccessToken(String value);

  Future<String?> getAccessToken();

  Future<void> deleteAccessToken();

  Future<Either<AuthFailure, U>> getUserData();

  Future<void> setPinCode(String value);

  Future<bool> comparePinCode(String value);

  Future<void> deletePinCode();

  Future<bool> hasPinCode();

  Future<void> deleteUseBiometric();

  Future<void> setUseBiometric({required bool value});

  Future<bool?> get useBiometric;

  Future<void> setUseLocalAuth(bool value);

  Future<bool> useLocalAuth();

  Future<void> deleteUseLocalAuth();

  Future<Either<AuthFailure, U>> getCurrentUser();

  Future<Either<AuthFailure, void>> setCurrentUser(U user);

  Future<void> finishOnboarding();

  Future<bool> watchedOnboarding();
}
