import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/features/home/domain/entities/meal_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderProductTile extends StatelessWidget {
  const OrderProductTile({super.key, required this.meal});

  final MealEntity meal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: AppColors.black.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: meal.image.isEmpty
                ? Container(
                    width: 56.r,
                    height: 56.r,
                    color: AppColors.grey,
                    child: Icon(
                      Icons.fastfood_rounded,
                      color: AppColors.white,
                      size: 24.r,
                    ),
                  )
                : Image.network(
                    meal.image,
                    width: 56.r,
                    height: 56.r,
                    fit: BoxFit.cover,
                  ),
          ),
          12.ws,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.textMedium14.copyWith(
                    color: AppColors.white,
                  ),
                ),
                4.hs,
                Text(
                  '${meal.totalCalories} kcal',
                  style: AppStyles.textRegular14.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${meal.price}',
                style: AppStyles.textSemiBold16.copyWith(
                  color: AppColors.orange,
                ),
              ),
              4.hs,
              Text(
                'x${meal.quantity}',
                style: AppStyles.textRegular14.copyWith(
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
