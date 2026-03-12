import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/features/home/domain/entities/meal_entity.dart';
import 'package:flutter/material.dart';

class MealHeader extends StatefulWidget {
  const MealHeader({super.key, required this.meal});

  final MealEntity meal;

  @override
  State<MealHeader> createState() => _MealHeaderState();
}

class _MealHeaderState extends State<MealHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.meal.name, style: AppStyles.textSemiBold22),
        8.hs,
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber.shade400),
            Icon(Icons.star, color: Colors.amber.shade400),
            Icon(Icons.star, color: Colors.amber.shade400),
            Icon(Icons.star, color: Colors.amber.shade400),
            Icon(Icons.star, color: Colors.amber.shade400),
            8.ws,
            Text('4.7', style: AppStyles.textRegular20),
            Spacer(),
            IconButton(
              onPressed: () {
                setState(() {
                  widget.meal.quantity++;
                });
              },
              icon: const Icon(Icons.add, color: AppColors.white, size: 30),
            ),
            8.ws,
            Text(
              widget.meal.quantity.toString(),
              style: AppStyles.textRegular20.copyWith(color: AppColors.white),
            ),
            8.ws,
            IconButton(
              onPressed: () {
                setState(() {
                  if (widget.meal.quantity > 1) widget.meal.quantity--;
                });
              },
              icon: const Icon(Icons.remove, color: AppColors.white, size: 30),
            ),
          ],
        ),
      ],
    );
  }
}
