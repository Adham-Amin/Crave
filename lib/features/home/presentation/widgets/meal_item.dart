import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/routing/app_routes.dart';
import 'package:crave/core/utils/app_assets.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/features/home/domain/entities/meal_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final MealEntity meal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRoutes.mealDetails, extra: meal),
      child: Container(
        height: 120.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.darkGrey,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(16.r),
              ),
              child: meal.image == ''
                  ? Container(
                      height: double.infinity,
                      width: 140.w,
                      color: AppColors.grey,
                    )
                  : CachedNetworkImage(
                      imageUrl: meal.image,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: 140.w,
                    ),
            ),
            16.ws,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal.name,
                    maxLines: 1,
                    style: AppStyles.textRegular18.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  10.hs,
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.svgsKcal, height: 14.h),
                      4.ws,
                      Text(
                        '${meal.totalCalories} kcal',
                        style: AppStyles.textRegular14.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      8.ws,
                      SvgPicture.asset(AppAssets.svgsWeight, height: 14.h),
                      4.ws,
                      Text(
                        '${meal.protien} g',
                        style: AppStyles.textRegular14.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  10.hs,
                  Row(
                    children: [
                      Text(
                        '\$${meal.price}',
                        style: AppStyles.textBold18.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.favorite_border, color: AppColors.white),
                    ],
                  ),
                ],
              ),
            ),
            16.ws,
          ],
        ),
      ),
    );
  }
}
