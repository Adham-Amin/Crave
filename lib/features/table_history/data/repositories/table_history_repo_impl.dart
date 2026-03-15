import 'package:crave/core/errors/failure.dart';
import 'package:crave/features/table_history/data/datasources/table_history_remote_data_source.dart';
import 'package:crave/features/table_history/data/models/table_history_response/table_history_response.dart';
import 'package:crave/features/table_history/domain/repositories/table_history_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class TableHistoryRepoImpl extends TableHistoryRepo {
  final TableHistoryRemoteDataSource tableHistoryRemoteDataSource;
  TableHistoryRepoImpl({required this.tableHistoryRemoteDataSource});

  @override
  Future<Either<Failure, TableHistoryResponse>> getTableHistory() async {
    try {
      final response = await tableHistoryRemoteDataSource.getTableHistory();
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
