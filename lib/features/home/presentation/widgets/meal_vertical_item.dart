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

class MealVerticalItem extends StatelessWidget {
  const MealVerticalItem({super.key, required this.meal});

  final MealEntity meal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRoutes.mealDetails, extra: meal),
      child: Container(
        width: 240.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.darkGrey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
              child: meal.image == ''
                  ? Container(
                      height: 219.h,
                      width: double.infinity,
                      color: AppColors.grey,
                    )
                  : CachedNetworkImage(
                      imageUrl: meal.image,
                      fit: BoxFit.cover,
                      height: 219.h,
                      width: double.infinity,
                    ),
            ),
            16.hs,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                16.ws,
                Expanded(
                  flex: 4,
                  child: Text(
                    meal.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.textRegular18.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
                16.ws,
              ],
            ),
            8.hs,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                16.ws,
                Text(
                  '\$${meal.price}',
                  style: AppStyles.textBold18.copyWith(color: AppColors.white),
                ),
                16.ws,
                SvgPicture.asset(AppAssets.svgsKcal, height: 18.h, width: 18.w),
                4.ws,
                Text(
                  '${meal.totalCalories} kcal',
                  style: AppStyles.textRegular14.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.white,
                  ),
                ),
                16.ws,
              ],
            ),
            16.hs,
          ],
        ),
      ),
    );
  }
}
