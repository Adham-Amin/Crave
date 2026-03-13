import 'package:crave/core/errors/failure.dart';
import 'package:crave/features/tables/data/models/tables_request.dart';
import 'package:dartz/dartz.dart';

abstract class TablesRepo {
  Future<Either<Failure, void>> storeTable({required TablesRequest table});
}
