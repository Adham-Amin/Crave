part of 'meals_by_category_cubit.dart';

sealed class MealsByCategoryState {}

final class MealsByCategoryInitial extends MealsByCategoryState {}

final class MealsByCategoryLoading extends MealsByCategoryState {}

final class MealsByCategorySuccess extends MealsByCategoryState {
  final List<MealEntity> meals;
  MealsByCategorySuccess({required this.meals});
}

final class MealsByCategoryError extends MealsByCategoryState {
  final String message;
  MealsByCategoryError({required this.message});
}
