import 'package:crave/core/services/api_service.dart';
import 'package:crave/features/tables/data/models/tables_request.dart';

abstract class TablesDataSource {
  Future<void> storeTable({required TablesRequest table});
}

class TablesDataSourceImpl implements TablesDataSource {
  final ApiService _apiService;
  TablesDataSourceImpl({required ApiService apiService})
    : _apiService = apiService;

  @override
  Future<void> storeTable({required TablesRequest table}) async {
    await _apiService.post(endPoint: '/table_reserve', data: table.toMap());
  }
}
