import 'package:crave/core/errors/failure.dart';
import 'package:crave/features/auth/data/models/register_request.dart';
import 'package:crave/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> register({
    required RegisterRequest userInfo,
  });
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });
}
