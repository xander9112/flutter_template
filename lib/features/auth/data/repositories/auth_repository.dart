import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quiz/features/auth/_auth.dart';
import 'package:quiz/features/debug/_debug.dart';

class AuthRepository implements IAuthRepository<TokensDTO, UserEntity> {
  AuthRepository({
    required RemoteAuthDataSource remoteAuthDataSource,
    required AuthStorage authStorage,
    required UserStorage userStorage,
  }) : _remoteAuthDataSource = remoteAuthDataSource,
       _authStorage = authStorage,
       _userStorage = userStorage;
  final RemoteAuthDataSource _remoteAuthDataSource;
  final AuthStorage _authStorage;
  final UserStorage _userStorage;

  @override
  Future<bool?> get useBiometric => _authStorage.useBiometric;

  @override
  Future<bool> comparePinCode(String value) {
    return _authStorage.comparePinCode(value);
  }

  @override
  Future<void> deleteAccessToken() {
    return _authStorage.removeToken();
  }

  @override
  Future<void> deletePinCode() {
    return _authStorage.removePinCode();
  }

  @override
  Future<void> deleteUseBiometric() {
    return _authStorage.removeUseBiometric();
  }

  @override
  Future<String?> getAccessToken() {
    return _authStorage.getToken();
  }

  @override
  Future<bool> hasAccessToken() {
    return _authStorage.hasToken;
  }

  @override
  Future<bool> hasPinCode() {
    return _authStorage.hasPinCode;
  }

  @override
  Future<void> setAccessToken(String value) {
    return _authStorage.setToken(value);
  }

  @override
  Future<void> setPinCode(String value) {
    return _authStorage.setPinCode(value);
  }

  @override
  Future<void> setUseBiometric({required bool value}) {
    return _authStorage.setUseBiometric(value);
  }

  @override
  Future<void> setUseLocalAuth(bool value) {
    return _authStorage.setUseLocalAuth(value);
  }

  @override
  Future<bool> useLocalAuth() {
    return _authStorage.useLocalAuth;
  }

  @override
  Future<void> deleteUseLocalAuth() {
    return _authStorage.removeUseLocalAuth();
  }

  @override
  Future<Either<Failure, TokensDTO>> signIn(
    String login,
    String password,
  ) async {
    try {
      final result = await _remoteAuthDataSource.signIn(
        request: <String, dynamic>{'login': login, 'password': password},
      );

      final userResult = await _remoteAuthDataSource.getUserData();

      await _userStorage.saveCurrentUser(jsonEncode(userResult.toJson()));

      return Right(result);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown) {
        return Left(
          AuthFailure(code: 0, message: e.message ?? e.error.toString()),
        );
      }

      if (e.type == DioExceptionType.connectionTimeout) {
        return Left(
          AuthFailure(code: 503, message: e.message ?? e.error.toString()),
        );
      }

      return Left(
        AuthFailure(
          code: e.response?.statusCode ?? 0,
          message: e.message ?? e.error.toString(),
        ),
      );
    } catch (e) {
      return Left(AuthFailure(code: 0, message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TokensDTO>> signUp(
    String login,
    String password,
  ) async {
    try {
      final result = await _remoteAuthDataSource.signUp(
        request: <String, dynamic>{'login': login, 'password': password},
      );

      final userResult = await _remoteAuthDataSource.getUserData();

      await _userStorage.saveCurrentUser(jsonEncode(userResult.toJson()));

      return Right(result);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown) {
        return Left(
          AuthFailure(code: 0, message: e.message ?? e.error.toString()),
        );
      }

      if (e.type == DioExceptionType.connectionTimeout) {
        return Left(
          AuthFailure(code: 503, message: e.message ?? e.error.toString()),
        );
      }

      return Left(
        AuthFailure(
          code: e.response?.statusCode ?? 0,
          message: e.message ?? e.error.toString(),
        ),
      );
    } catch (e) {
      return Left(AuthFailure(code: 0, message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      await _remoteAuthDataSource.signOut();

      await _userStorage.removeCurrentUser();

      await _userStorage.resetOnboarding();

      await _authStorage.removePinCode();

      await _userStorage.finishOnboarding(isFinish: false);

      return const Right(true);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown) {
        return Left(AuthFailure(code: 0, message: ''));
      }

      return Left(AuthFailure(code: e.response?.statusCode ?? 0, message: ''));
    } catch (e) {
      print('ERROR: $e');
      return Left(AuthFailure(code: 0, message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthenticatedUser>> getUserData() async {
    try {
      final result = await _remoteAuthDataSource.getUserData();

      final token = await _authStorage.getToken();

      if (token != null) {
        await _authStorage.setToken(token);
      }

      await _userStorage.saveCurrentUser(jsonEncode(result.toJson()));

      return Right(result);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown) {
        return Left(
          AuthFailure(code: 0, message: e.message ?? e.error.toString()),
        );
      }

      return Left(
        AuthFailure(
          code: e.response?.statusCode ?? 0,
          message: e.message ?? e.error.toString(),
        ),
      );
    } catch (e) {
      return Left(AuthFailure(code: 0, message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthenticatedUser>> getCurrentUser() async {
    try {
      final user = await _userStorage.getCurrentUser();

      if (user != null) {
        return Right(AuthenticatedUser.fromJson(jsonDecode(user)));
      }

      return Left(AuthFailure(code: 0, message: 'User not found'));
    } catch (e) {
      return Left(AuthFailure(code: 0, message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setCurrentUser(UserEntity user) async {
    try {
      await _userStorage.saveCurrentUser(jsonEncode(user));

      return const Right(null);
    } catch (e) {
      return Left(AuthFailure(code: 0, message: ''));
    }
  }

  @override
  Future<void> blockUser(DateTime value) {
    return _authStorage.blockUser(value);
  }

  @override
  Future<void> unBlocUser() {
    return _authStorage.unBlockUser();
  }

  @override
  Future<DateTime?> getBlockTime() async {
    return _authStorage.getBlockTime();
  }

  @override
  Future<void> finishOnboarding() async {
    return _userStorage.finishOnboarding();
  }

  @override
  Future<bool> watchedOnboarding() async {
    return _userStorage.watchedOnboarding();
  }
}
