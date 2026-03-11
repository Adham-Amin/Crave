import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/widgets/custom_text_form_field.dart';
import 'package:crave/features/home/data/models/bannar_model.dart';
import 'package:crave/features/home/presentation/manager/combined_meals/combined_meals_cubit.dart';
import 'package:crave/features/home/presentation/widgets/category_list.dart';
import 'package:crave/features/home/presentation/widgets/home_header.dart';
import 'package:crave/features/home/presentation/widgets/recommended_list.dart';
import 'package:crave/features/home/presentation/widgets/section_title.dart';
import 'package:crave/features/home/presentation/widgets/slider_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CombinedMealsCubit, CombinedMealsState>(
      builder: (context, state) {
        if (state is CombinedMealsError) {
          return Expanded(child: Center(child: Text(state.message)));
        }
        return Skeletonizer(
          enabled: state is CombinedMealsLoading,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                HomeHeader(),
                24.hs,
                CustomTextFormField(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                ),
                24.hs,
                SliderSection(sliders: BannarModel.bannarList),
                24.hs,
                const SectionTitle('MENU'),
                24.hs,
                CategoryList(),
                24.hs,
                const SectionTitle('RECOMMENDED'),
                24.hs,
                RecommendedList(
                  meals: context.read<CombinedMealsCubit>().meals,
                ),
                24.hs,
              ],
            ),
          ),
        );
      },
    );
  }
}
