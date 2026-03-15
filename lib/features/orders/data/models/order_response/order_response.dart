import 'package:crave/features/orders/domain/entities/order_entity.dart';

import 'product.dart';

class OrderResponse {
  String? orderDate;
  String? totalPrice;
  List<Product>? products;

  OrderResponse({this.orderDate, this.totalPrice, this.products});

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
    orderDate: json['order_date'] as String?,
    totalPrice: json['total_price'] as String?,
    products: (json['products'] as List<dynamic>?)
        ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'order_date': orderDate,
    'total_price': totalPrice,
    'products': products?.map((e) => e.toJson()).toList(),
  };

  OrderEntity toEntity() => OrderEntity(
    date: orderDate ?? '',
    totalPrice: totalPrice ?? '',
    products: products?.map((e) => e.toEntity()).toList() ?? [],
  );
}
