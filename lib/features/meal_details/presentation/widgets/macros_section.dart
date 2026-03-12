import 'package:crave/features/home/domain/entities/meal_entity.dart';
import 'package:crave/features/meal_details/presentation/widgets/macros_item.dart';
import 'package:flutter/material.dart';

class MacrosSection extends StatelessWidget {
  const MacrosSection({super.key, required this.meal});

  final MealEntity meal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MacrosItem(label: 'Calories', value: meal.totalCalories),
        MacrosItem(label: 'Carbs', value: meal.carb),
        MacrosItem(label: 'Protein', value: meal.protien),
        MacrosItem(label: 'Fat', value: meal.fat),
      ],
    );
  }
}
