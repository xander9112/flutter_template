import 'package:dartz/dartz.dart';
import 'package:quiz/features/auth/_auth.dart';
import 'package:quiz/features/debug/_debug.dart';

abstract class AuthRepository {
  Future<Either<Failure, TokensDTO>> signIn();
}
