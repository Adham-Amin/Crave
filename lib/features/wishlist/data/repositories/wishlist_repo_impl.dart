import 'package:crave/core/errors/failure.dart';
import 'package:crave/features/home/domain/entities/meal_entity.dart';
import 'package:crave/features/wishlist/data/datasources/wishlist_remote_data_source.dart';
import 'package:crave/features/wishlist/domain/repositories/wishlist_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class WishlistRepoImpl implements WishlistRepo {

  final WishlistRemoteDataSource wishlistRemoteDataSource;
  WishlistRepoImpl({required this.wishlistRemoteDataSource});

  @override
  Future<Either<Failure, void>> addMealToWishlist({required String name}) async {
    try {
      await wishlistRemoteDataSource.addItemToWishlist(name: name);
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MealEntity>>> getWishlistMeals() async {
    try {
      var data = await wishlistRemoteDataSource.getWishlistItems();
      var meals = data.map((e) => e.product!.toEntity()).toList();
      return Right(meals);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
    
  }

  @override
  Future<Either<Failure, void>> removeMealFromWishlist({required String name}) async {
    try {
      await wishlistRemoteDataSource.removeItemFromWishlist(name: name);
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}