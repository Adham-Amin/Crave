import 'package:crave/core/services/api_service.dart';
import 'package:crave/features/orders/data/models/order_response/order_response.dart';

abstract class OrderRemoteDataSource {
  Future<List<OrderResponse>> getOrdersHistory();
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final ApiService _apiService;
  OrderRemoteDataSourceImpl({required ApiService apiService})
    : _apiService = apiService;
  @override
  Future<List<OrderResponse>> getOrdersHistory() async {
    var response = await _apiService.post(endPoint: '/order_history');

    List<OrderResponse> data = [];
    for (var order in response['data']) {
      data.add(OrderResponse.fromJson(order));
    }
    return data;
  }
}
