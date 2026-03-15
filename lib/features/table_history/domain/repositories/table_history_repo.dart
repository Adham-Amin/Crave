import 'package:crave/core/errors/failure.dart';
import 'package:crave/features/table_history/data/models/table_history_response/table_history_response.dart';
import 'package:dartz/dartz.dart';

abstract class TableHistoryRepo {
  Future<Either<Failure, TableHistoryResponse>> getTableHistory();
}
