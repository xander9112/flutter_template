import 'package:dartz/dartz.dart';
import 'package:quiz/core/failure.dart';
import 'package:quiz/features/_features.dart';

abstract class AuthRepository {
  Future<Either<Failure, TokensDTO>> signIn();
}
