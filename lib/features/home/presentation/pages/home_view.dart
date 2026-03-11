import 'package:crave/core/di/service_locator.dart';
import 'package:crave/features/home/domain/repositories/home_repo.dart';
import 'package:crave/features/home/presentation/manager/combined_meals/combined_meals_cubit.dart';
import 'package:crave/features/home/presentation/manager/meals_bu_category/meals_by_category_cubit.dart';
import 'package:crave/features/home/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              MealsByCategoryCubit(homeRepo: getIt<HomeRepo>())
                ..getMealsByCategory(category: 'Break Fast'),
        ),
        BlocProvider(
          create: (context) =>
              CombinedMealsCubit(homeRepo: getIt<HomeRepo>())
                ..getCombinedMeals(),
        ),
      ],
      child: const Scaffold(body: SafeArea(child: HomeViewBody())),
    );
  }
}
