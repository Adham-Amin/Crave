import 'package:crave/core/functions/extentions.dart';
import 'package:crave/features/home/domain/entities/meal_entity.dart';
import 'package:crave/features/home/presentation/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class RecommendedList extends StatelessWidget {
  const RecommendedList({super.key, required this.meals});

  final List<MealEntity> meals;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => 16.hs,
      itemBuilder: (context, index) => MealItem(meal: meals[index]),
    );
  }
}
