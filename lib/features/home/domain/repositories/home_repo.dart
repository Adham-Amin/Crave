import 'package:crave/core/errors/failure.dart';
import 'package:crave/features/home/domain/entities/meal_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MealEntity>>> getMealsByCategory({
    required String category,
  });

  Future<Either<Failure, List<MealEntity>>> getCombinedMeals();
}
