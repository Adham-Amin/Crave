import 'package:crave/core/services/api_service.dart';
import 'package:crave/features/table_history/data/models/table_history_response/table_history_response.dart';

abstract class TableHistoryRemoteDataSource {
  Future<TableHistoryResponse> getTableHistory();
}

class TableHistoryRemoteDataSourceImpl implements TableHistoryRemoteDataSource {
  final ApiService _apiService;

  TableHistoryRemoteDataSourceImpl({required ApiService apiService})
    : _apiService = apiService;
  @override
  Future<TableHistoryResponse> getTableHistory() async {
    var response = await _apiService.get(endPoint: '/table_reserve/latest');
    return TableHistoryResponse.fromJson(response['data']);
  }
}
