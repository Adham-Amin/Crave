import 'package:crave/core/errors/failure.dart';
import 'package:crave/features/calories_store/data/datasources/calories_store_data_source.dart';
import 'package:crave/features/calories_store/data/models/calories_store_request.dart';
import 'package:crave/features/calories_store/domain/repositories/calories_store_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CaloriesStoreRepoImpl implements CaloriesStoreRepo {
  final CaloriesStoreDataSource caloriesStoreDataSource;
  CaloriesStoreRepoImpl({required this.caloriesStoreDataSource});

  @override
  Future<Either<Failure, num>> calculateCalories({
    required CaloriesStoreRequest params,
  }) async {
    try {
      final response = await caloriesStoreDataSource.calculateCalories(
        params: params,
      );
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
