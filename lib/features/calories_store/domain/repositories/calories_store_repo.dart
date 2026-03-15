import 'package:crave/core/errors/failure.dart';
import 'package:crave/features/calories_store/data/models/calories_store_request.dart';
import 'package:dartz/dartz.dart';

abstract class CaloriesStoreRepo {
  Future<Either<Failure, num>> calculateCalories({
    required CaloriesStoreRequest params,
  });
}
