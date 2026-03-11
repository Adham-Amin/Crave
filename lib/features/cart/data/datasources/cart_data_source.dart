import 'package:crave/core/services/api_service.dart';
import 'package:crave/features/cart/data/models/cart_request/cart_request.dart';

abstract class CartDataSource {
  Future<void> storeOrder({required CartRequest order});
}

class CartDataSourceImpl implements CartDataSource {
  final ApiService _apiService;
  CartDataSourceImpl({required ApiService apiService})
    : _apiService = apiService;

  @override
  Future<void> storeOrder({required CartRequest order}) async {
    await _apiService.post(endPoint: '/orders', data: order.toJson());
  }
}
