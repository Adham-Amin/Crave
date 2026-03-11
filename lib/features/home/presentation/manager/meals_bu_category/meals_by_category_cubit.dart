import 'package:crave/features/home/domain/entities/meal_entity.dart';
import 'package:crave/features/home/domain/repositories/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'meals_by_category_state.dart';

class MealsByCategoryCubit extends Cubit<MealsByCategoryState> {
  MealsByCategoryCubit({required this.homeRepo})
    : super(MealsByCategoryInitial());

  final HomeRepo homeRepo;

  List<MealEntity> meals = [
    MealEntity(
      id: 0,
      name: 'Meal Name',
      description: 'Meal Description here ... Meal Description here ... ',
      image: '',
      price: 0,
      totalCalories: 0,
      protien: 0,
      carb: 0,
      fat: 0,
      weight: 0,
    ),
    MealEntity(
      id: 1,
      name: 'Meal Name',
      description: 'Meal Description here ... Meal Description here ... ',
      image: '',
      price: 0,
      totalCalories: 0,
      protien: 0,
      carb: 0,
      fat: 0,
      weight: 0,
    ),
    MealEntity(
      id: 1,
      name: 'Meal Name',
      description: 'Meal Description here ... Meal Description here ... ',
      image: '',
      price: 0,
      totalCalories: 0,
      protien: 0,
      carb: 0,
      fat: 0,
      weight: 0,
    ),
  ];

  Future<void> getMealsByCategory({required String category}) async {
    emit(MealsByCategoryLoading());
    final result = await homeRepo.getMealsByCategory(category: category);
    result.fold(
      (failure) => emit(MealsByCategoryError(message: failure.message)),
      (mealsList) {
        meals = mealsList;
        emit(MealsByCategorySuccess(meals: mealsList));
      },
    );
  }
}
