import 'package:crave/features/home/domain/entities/meal_entity.dart';

class OrderEntity {
  final String date;
  final String totalPrice;
  final List<MealEntity> products;

  OrderEntity({
    required this.date,
    required this.totalPrice,
    required this.products,
  });
}
