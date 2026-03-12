import 'package:crave/features/home/domain/entities/meal_entity.dart';
import 'package:crave/features/meal_details/presentation/widgets/meal_details_view_body.dart';
import 'package:flutter/material.dart';

class MealDetailsView extends StatelessWidget {
  const MealDetailsView({super.key, required this.meal});

  final MealEntity meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MealDetailsViewBody(meal: meal));
  }
}
