import 'package:crave/features/calories_store/data/models/calories_store_request.dart';
import 'package:crave/features/calories_store/domain/repositories/calories_store_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'calories_store_state.dart';

class CaloriesStoreCubit extends Cubit<CaloriesStoreState> {
  CaloriesStoreCubit({required this.caloriesStoreRepo})
    : super(CaloriesStoreInitial());

  final CaloriesStoreRepo caloriesStoreRepo;

  Future<void> calculateCalories({required CaloriesStoreRequest params}) async {
    emit(CaloriesStoreLoading());
    final result = await caloriesStoreRepo.calculateCalories(params: params);
    result.fold(
      (l) => emit(CaloriesStoreError(message: l.message)),
      (r) => emit(CaloriesStoreSuccess(calories: r)),
    );
  }
}
