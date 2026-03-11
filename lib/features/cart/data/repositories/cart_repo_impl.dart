import 'package:crave/core/errors/failure.dart';
import 'package:crave/features/cart/data/datasources/cart_data_source.dart';
import 'package:crave/features/cart/data/models/cart_request/cart_request.dart';
import 'package:crave/features/cart/domain/repositories/cart_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CartRepoImpl extends CartRepo {
  final CartDataSource _cartDataSource;
  CartRepoImpl({required CartDataSource cartDataSource})
    : _cartDataSource = cartDataSource;
  @override
  Future<Either<Failure, void>> storeOrder({required CartRequest order}) async {
    try {
      return Right(await _cartDataSource.storeOrder(order: order));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
