import 'package:dartz/dartz.dart';
import 'package:shop_flow/core/errors/failure.dart';
import 'package:shop_flow/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signIn(
      {required String email, required String password});
  Future<Either<Failure, UserEntity>> signUp(
      {required String email, required String password});
}
