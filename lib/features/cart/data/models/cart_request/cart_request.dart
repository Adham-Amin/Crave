import 'product.dart';

class CartRequest {
  int? totalPrice;
  List<Product>? products;

  CartRequest({this.totalPrice, this.products});

  Map<String, dynamic> toJson() => {
    'total_price': totalPrice,
    'payment_method': "credit_card",
    'products': products?.map((e) => e.toJson()).toList(),
  };
}
