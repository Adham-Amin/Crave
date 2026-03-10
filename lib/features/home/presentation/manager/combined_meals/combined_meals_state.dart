part of 'combined_meals_cubit.dart';

sealed class CombinedMealsState {}

final class CombinedMealsInitial extends CombinedMealsState {}

final class CombinedMealsLoading extends CombinedMealsState {}

final class CombinedMealsError extends CombinedMealsState {
  final String message;
  CombinedMealsError({required this.message});
}

final class CombinedMealsSuccess extends CombinedMealsState {
  final List<MealEntity> meals;
  CombinedMealsSuccess({required this.meals});
}
