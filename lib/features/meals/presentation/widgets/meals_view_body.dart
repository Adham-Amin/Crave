import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/widgets/custom_text_form_field.dart';
import 'package:crave/features/home/domain/entities/meal_entity.dart';
import 'package:crave/features/home/presentation/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class MealsViewBody extends StatelessWidget {
  const MealsViewBody({super.key, required this.meals});

  final List<MealEntity> meals;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          24.hs,
          CustomTextFormField(
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search),
          ),
          24.hs,
          Expanded(
            child: ListView.separated(
              itemCount: meals.length,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => 16.hs,
              itemBuilder: (context, index) => MealItem(meal: meals[index]),
            ),
          ),
          24.hs,
        ],
      ),
    );
  }
}
