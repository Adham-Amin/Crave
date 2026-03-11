import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/features/home/domain/entities/meal_entity.dart';
import 'package:crave/features/meals/presentation/widgets/meals_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MealsView extends StatelessWidget {
  const MealsView({super.key, required this.title, required this.meals});

  final String title;
  final List<MealEntity> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(title, style: AppStyles.textBold24),
        centerTitle: true,
      ),
      body: MealsViewBody(meals: meals),
    );
  }
}
