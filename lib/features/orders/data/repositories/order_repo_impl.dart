import 'package:crave/core/errors/failure.dart';
import 'package:crave/features/orders/data/datasources/order_remote_data_source.dart';
import 'package:crave/features/orders/domain/entities/order_entity.dart';
import 'package:crave/features/orders/domain/repositories/order_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class OrderRepoImpl extends OrderRepo {
  final OrderRemoteDataSource _orderRemoteDataSource;
  OrderRepoImpl({required OrderRemoteDataSource orderRemoteDataSource})
    : _orderRemoteDataSource = orderRemoteDataSource;

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrdersHistory() async {
    try {
      var data = await _orderRemoteDataSource.getOrdersHistory();
      return Right(data.map((e) => e.toEntity()).toList());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
