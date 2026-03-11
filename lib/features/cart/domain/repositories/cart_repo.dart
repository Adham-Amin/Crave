import 'package:crave/core/errors/failure.dart';
import 'package:crave/features/cart/data/models/cart_request/cart_request.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepo {
  Future<Either<Failure, void>> storeOrder({required CartRequest order});
}
