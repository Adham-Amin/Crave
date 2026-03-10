import 'package:crave/features/home/domain/entities/meal_entity.dart';
import 'package:crave/features/home/domain/repositories/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'combined_meals_state.dart';

class CombinedMealsCubit extends Cubit<CombinedMealsState> {
  CombinedMealsCubit({required this.homeRepo}) : super(CombinedMealsInitial());

  final HomeRepo homeRepo;

  Future<void> getCombinedMeals() async {
    emit(CombinedMealsLoading());
    var result = await homeRepo.getCombinedMeals();
    result.fold((l) => emit(CombinedMealsError(message: l.message)), (r) {
      emit(CombinedMealsSuccess(meals: r));
    });
  }
}
