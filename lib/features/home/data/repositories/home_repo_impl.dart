import 'package:crave/core/errors/failure.dart';
import 'package:crave/features/home/data/datasources/home_remote_data_source.dart';
import 'package:crave/features/home/domain/entities/meal_entity.dart';
import 'package:crave/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<MealEntity>>> getCombinedMeals() async {
    try {
      final response = await homeRemoteDataSource.getCombinedMeals();
      var mealsList = response.map((e) => e.toEntity()).toList();
      return Right(mealsList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MealEntity>>> getMealsByCategory({
    required String category,
  }) async {
    try {
      final response = await homeRemoteDataSource.getMealsByCategory(
        category: category,
      );
      var mealsList = response.map((e) => e.toEntity()).toList();
      return Right(mealsList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
