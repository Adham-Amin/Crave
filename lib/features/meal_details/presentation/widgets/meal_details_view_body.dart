import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/core/widgets/custom_button.dart';
import 'package:crave/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:crave/features/home/domain/entities/meal_entity.dart';
import 'package:crave/features/meal_details/presentation/widgets/macros_section.dart';
import 'package:crave/features/meal_details/presentation/widgets/meal_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealDetailsViewBody extends StatelessWidget {
  const MealDetailsViewBody({super.key, required this.meal});

  final MealEntity meal;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 120.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                meal.image,
                width: double.infinity,
                height: 320.h,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    24.hs,
                    MealHeader(meal: meal),
                    24.hs,
                    Text(meal.description, style: AppStyles.textRegular16),
                    32.hs,
                    MacrosSection(meal: meal),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 48.h,
          left: 16.w,
          right: 16.w,
          child: Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border, color: AppColors.white),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 16,
                bottom: 16,
              ),
              decoration: BoxDecoration(
                color: AppColors.darkGrey,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total Price', style: AppStyles.textRegular16),
                        Text(
                          '\$${meal.price}',
                          style: AppStyles.textSemiBold20,
                        ),
                      ],
                    ),
                  ),
                  16.ws,
                  BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      final inCart = context.select<CartCubit, bool>(
                        (cubit) => cubit.cart.any((e) => e.id == meal.id),
                      );
                      return Expanded(
                        flex: 2,
                        child: CustomButton(
                          title: inCart ? 'Remove from Cart' : 'Add to Cart',
                          onTap: () {
                            if (inCart) {
                              context.read<CartCubit>().removeFromCart(
                                meal: meal,
                              );
                            } else {
                              context.read<CartCubit>().addToCart(meal: meal);
                            }
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
