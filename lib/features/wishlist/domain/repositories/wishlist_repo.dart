import 'package:crave/core/errors/failure.dart';
import 'package:crave/features/home/domain/entities/meal_entity.dart';
import 'package:dartz/dartz.dart';

abstract class WishlistRepo {
  Future<Either<Failure, List<MealEntity>>> getWishlistMeals();
  Future<Either<Failure, void>> addMealToWishlist({
    required String name,
  });
  Future<Either<Failure, void>> removeMealFromWishlist({
    required String name,
  });
}