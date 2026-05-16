import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/features/home/domain/entities/meal_entity.dart';
import 'package:crave/features/home/presentation/widgets/meal_item.dart';
import 'package:crave/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WishlistViewBody extends StatelessWidget {
  const WishlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: BlocBuilder<WishlistCubit, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoaded) {
            final meals = context.read<WishlistCubit>().meals;
            if (meals.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.favorite_border, size: 64),
                    16.hs,
                    Text('Your Favorites is empty.', style: AppStyles.textSemiBold20,),
                  ],
                ),
              );
            }
            
            return ListView.separated(
              itemCount: meals.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final meal = meals[index];
                return MealItem(meal: meal);
              },
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
            );
          } else if (state is WishlistError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is WishlistLoading) {
            return WishListShimmer();
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}


class WishListShimmer extends StatelessWidget {
  const WishListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
                itemCount: 6,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return MealItem(meal: MealEntity(
                  id: 5,
                  name: 'Loading',
                  description: 'Loading',
                  image: 'https://via.placeholder.com/150',
                  price: 453,
                  totalCalories: 0,
                  protien: 0,
                  carb: 0,
                  fat: 0,
                  weight: 0,
                  ));
                },
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
              ),
    );
  }
}