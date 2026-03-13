import 'package:crave/core/errors/failure.dart';
import 'package:crave/features/tables/data/datasources/tables_data_source.dart';
import 'package:crave/features/tables/data/models/tables_request.dart';
import 'package:crave/features/tables/domain/repositories/tables_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class TablesRepoImpl extends TablesRepo {
  final TablesDataSource _tablesDataSource;
  TablesRepoImpl({required TablesDataSource tablesDataSource})
    : _tablesDataSource = tablesDataSource;

  @override
  Future<Either<Failure, void>> storeTable({
    required TablesRequest table,
  }) async {
    try {
      await _tablesDataSource.storeTable(table: table);
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
