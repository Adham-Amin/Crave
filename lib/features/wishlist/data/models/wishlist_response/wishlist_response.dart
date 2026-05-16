import 'product.dart';

class WishlistResponse {
  Product? product;

  WishlistResponse({this.product});

  factory WishlistResponse.fromJson(Map<String, dynamic> json) {
    return WishlistResponse(
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {'product': product?.toJson()};
}
