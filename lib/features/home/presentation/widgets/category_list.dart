import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/features/home/data/models/category_model.dart';
import 'package:crave/features/home/presentation/manager/meals_bu_category/meals_by_category_cubit.dart';
import 'package:crave/features/home/presentation/widgets/category_item.dart';
import 'package:crave/features/home/presentation/widgets/meal_vertical_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int currentIndex = 0;
  String category = CategoryModel.categoryList[0].name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 16.w,
            children: List.generate(CategoryModel.categoryList.length, (index) {
              return CategoryItem(
                onTap: () {
                  context.read<MealsByCategoryCubit>().getMealsByCategory(
                    category: CategoryModel.categoryList[index].name,
                  );
                  setState(() => currentIndex = index);
                },
                category: CategoryModel.categoryList[index],
                isSelected: currentIndex == index,
              );
            }),
          ),
        ),
        16.hs,
        BlocBuilder<MealsByCategoryCubit, MealsByCategoryState>(
          builder: (context, state) {
            if (state is MealsByCategoryError) {
              return SizedBox(
                height: 200.h,
                width: double.infinity,
                child: Center(child: Text(state.message)),
              );
            }
            return Skeletonizer(
              enabled: state is MealsByCategoryLoading,
              child: SizedBox(
                height: 320.h,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      ListView.separated(
                        separatorBuilder: (context, index) => 16.ws,
                        itemCount: 3,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => MealVerticalItem(
                          meal: context
                              .read<MealsByCategoryCubit>()
                              .meals[index],
                        ),
                      ),
                      16.ws,
                      IconButton(
                        onPressed: () {},
                        icon: Row(
                          children: [
                            Text('View all', style: AppStyles.textRegular14),
                            4.ws,
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
