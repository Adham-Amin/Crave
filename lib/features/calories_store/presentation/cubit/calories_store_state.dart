part of 'calories_store_cubit.dart';

abstract class CaloriesStoreState {}

class CaloriesStoreInitial extends CaloriesStoreState {}

class CaloriesStoreLoading extends CaloriesStoreState {}

class CaloriesStoreSuccess extends CaloriesStoreState {
  final num calories;

  CaloriesStoreSuccess({required this.calories});
}

class CaloriesStoreError extends CaloriesStoreState {
  final String message;

  CaloriesStoreError({required this.message});
}
