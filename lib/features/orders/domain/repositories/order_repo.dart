import 'package:crave/core/errors/failure.dart';
import 'package:crave/features/orders/domain/entities/order_entity.dart';
import 'package:dartz/dartz.dart';

abstract class OrderRepo {
  Future<Either<Failure, List<OrderEntity>>> getOrdersHistory();
}
