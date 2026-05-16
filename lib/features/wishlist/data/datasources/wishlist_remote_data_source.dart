import 'package:crave/core/services/api_service.dart';
import 'package:crave/features/wishlist/data/models/wishlist_response/wishlist_response.dart';

abstract class WishlistRemoteDataSource {
  Future<List<WishlistResponse>> getWishlistItems();
  Future<void> addItemToWishlist({
    required String name,
  });
  Future<void> removeItemFromWishlist({
    required String name,
  });
}

class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {

  final ApiService apiService;
  WishlistRemoteDataSourceImpl({required this.apiService});

  @override
  Future<void> addItemToWishlist({required String name}) async {
    await apiService.post(endPoint: '/favourite_store', data: {
      'product_name': name,
    });
  }

  @override
  Future<List<WishlistResponse>> getWishlistItems() async {
    var response = await apiService.get(endPoint: '/favourite');
    return (response['data'] as List)
        .map((e) => WishlistResponse.fromJson(e))
        .toList();
  }

  @override
  Future<void> removeItemFromWishlist({required String name}) async {
    await apiService.post(endPoint: '/favourite_delete', data: {
      'product_name': name,
    });
  }
}