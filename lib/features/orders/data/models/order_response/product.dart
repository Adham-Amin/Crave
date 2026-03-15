import 'package:crave/features/home/domain/entities/meal_entity.dart';
import 'package:crave/features/orders/data/models/order_response/product_item.dart';

class Product {
  ProductItem? product;
  int? quantity;
  String? unitPrice;
  String? subtotal;

  Product({this.product, this.quantity, this.unitPrice, this.subtotal});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    product: json['product'] == null
        ? null
        : ProductItem.fromJson(json['product']),
    quantity: json['quantity'] as int?,
    unitPrice: json['unit_price'] as String?,
    subtotal: json['subtotal'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'product': product?.toJson(),
    'quantity': quantity,
    'unit_price': unitPrice,
    'subtotal': subtotal,
  };

  MealEntity toEntity() => MealEntity(
    id: product?.id ?? 0,
    name: product?.name ?? '',
    description: product?.description ?? '',
    image: product?.image ?? '',
    price: product?.price ?? 0,
    totalCalories: product?.totalCalories ?? 0,
    protien: product?.protien ?? 0,
    carb: product?.carb ?? 0,
    fat: product?.fat ?? 0,
    weight: product?.weight ?? 0,
    quantity: quantity ?? 0,
  );
}
