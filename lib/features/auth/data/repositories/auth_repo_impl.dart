import 'package:crave/core/errors/failure.dart';
import 'package:crave/core/services/shared_preferences_service.dart';
import 'package:crave/features/auth/data/datasources/auth_data_source.dart';
import 'package:crave/features/auth/data/models/register_request.dart';
import 'package:crave/features/auth/domain/entities/user_entity.dart';
import 'package:crave/features/auth/domain/repositories/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthDataSource authDataSource;
  AuthRepoImpl({required this.authDataSource});
  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final data = await authDataSource.login(email: email, password: password);
      await Prefs.setToken(data.token ?? '');
      await Prefs.setUser(data.toEntity());
      return Right(data.toEntity());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register({
    required RegisterRequest userInfo,
  }) async {
    try {
      final data = await authDataSource.register(userInfo: userInfo);
      await Prefs.setToken(data.token ?? '');
      await Prefs.setUser(data.toEntity());
      return Right(data.toEntity());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
