import 'package:dartz/dartz.dart';
import 'package:quiz/core/failure.dart';
import 'package:quiz/features/auth/_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteAuthDataSource _dataSource;

  AuthRepositoryImpl({required RemoteAuthDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<Either<Failure, TokensDTO>> signIn() async {
    try {
      final response = await _dataSource.signIn();

      return Right(response);
    } catch (error) {
      return Left(AuthFailure(error: error.toString()));
    }
  }
}
