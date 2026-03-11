import 'package:crave/features/home/domain/entities/meal_entity.dart';
import 'package:crave/features/home/domain/repositories/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'combined_meals_state.dart';

class CombinedMealsCubit extends Cubit<CombinedMealsState> {
  CombinedMealsCubit({required this.homeRepo}) : super(CombinedMealsInitial());

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

  Future<void> getCombinedMeals() async {
    emit(CombinedMealsLoading());
    var result = await homeRepo.getCombinedMeals();
    result.fold((l) => emit(CombinedMealsError(message: l.message)), (r) {
      meals = r;
      emit(CombinedMealsSuccess(meals: r));
    });
  }
}
