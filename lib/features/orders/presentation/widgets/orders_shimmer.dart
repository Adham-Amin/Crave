import 'package:crave/core/functions/extentions.dart';
import 'package:crave/features/home/domain/entities/meal_entity.dart';
import 'package:crave/features/orders/domain/entities/order_entity.dart';
import 'package:crave/features/orders/presentation/widgets/order_item_card.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrdersShimmer extends StatelessWidget {
  const OrdersShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        itemCount: 4,
        separatorBuilder: (_, _) => 16.hs,
        itemBuilder: (context, index) => OrderItemCard(order: OrderEntity(date: 
            '', totalPrice: "350", products: [MealEntity(id: 4, name: "name", weight: 12, description: 'WHGEWHW', image: '', price: 211, totalCalories: 232, protien: 12, carb: 32, fat: 21)])),
      ),
    );
  }
}
