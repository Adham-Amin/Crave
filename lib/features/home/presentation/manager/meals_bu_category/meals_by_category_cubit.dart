import 'package:crave/features/home/domain/entities/meal_entity.dart';
import 'package:crave/features/home/domain/repositories/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'meals_by_category_state.dart';

class MealsByCategoryCubit extends Cubit<MealsByCategoryState> {
  MealsByCategoryCubit({required this.homeRepo})
    : super(MealsByCategoryInitial());

  final HomeRepo homeRepo;

  Future<void> getMealsByCategory({required String category}) async {
    emit(MealsByCategoryLoading());
    final result = await homeRepo.getMealsByCategory(category: category);
    result.fold(
      (failure) => emit(MealsByCategoryError(message: failure.message)),
      (meals) => emit(MealsByCategorySuccess(meals: meals)),
    );
  }
}
