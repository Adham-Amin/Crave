import 'package:crave/core/services/api_service.dart';
import 'package:crave/features/calories_store/data/models/calories_store_request.dart';

abstract class CaloriesStoreDataSource {
  Future<num> calculateCalories({required CaloriesStoreRequest params});
}

class CaloriesStoreDataSourceImpl implements CaloriesStoreDataSource {
  final ApiService apiService;
  CaloriesStoreDataSourceImpl({required this.apiService});

  @override
  Future<num> calculateCalories({required CaloriesStoreRequest params}) async {
    var response = await apiService.post(
      endPoint: '/calories_store',
      data: params.toMap(),
    );
    return response['data'];
  }
}
