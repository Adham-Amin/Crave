import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/utils/app_assets.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/features/cart/data/models/cart_request/product.dart';
import 'package:crave/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:crave/features/home/domain/entities/meal_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class MealCartItem extends StatefulWidget {
  const MealCartItem({super.key, required this.meal});

  final MealEntity meal;

  @override
  State<MealCartItem> createState() => _MealCartItemState();
}

class _MealCartItemState extends State<MealCartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.darkGrey,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(16.r)),
            child: widget.meal.image == ''
                ? Container(
                    height: double.infinity,
                    width: 140.w,
                    color: AppColors.grey,
                  )
                : Image.network(
                    widget.meal.image,
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
                  widget.meal.name,
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
                      '${widget.meal.totalCalories} kcal',
                      style: AppStyles.textRegular14.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    8.ws,
                    SvgPicture.asset(AppAssets.svgsWeight, height: 14.h),
                    4.ws,
                    Text(
                      '${widget.meal.protien} g',
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
                      '\$${widget.meal.price}',
                      style: AppStyles.textBold18.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.meal.quantity++;
                        });

                        context.read<CartCubit>().updateCart(
                          cartItem: Product(
                            productId: widget.meal.id.toInt(),
                            productQuantity: widget.meal.quantity.toInt(),
                            productUnitPrice: widget.meal.price.toInt(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add, color: AppColors.white),
                    ),
                    Text(
                      widget.meal.quantity.toString(),
                      style: AppStyles.textRegular16.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (widget.meal.quantity > 1) {
                          setState(() {
                            widget.meal.quantity--;
                          });

                          context.read<CartCubit>().updateCart(
                            cartItem: Product(
                              productId: widget.meal.id.toInt(),
                              productQuantity: widget.meal.quantity.toInt(),
                              productUnitPrice: widget.meal.price.toInt(),
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.remove, color: AppColors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          16.ws,
        ],
      ),
    );
  }
}
