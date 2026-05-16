import 'package:crave/core/services/shared_preferences_service.dart';
import 'package:crave/features/home/domain/entities/meal_entity.dart';
import 'package:crave/features/wishlist/domain/repositories/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit({required this.wishlistRepo}) : super(WishlistInitial());

  final WishlistRepo wishlistRepo;

  List<MealEntity> meals = [];

  Future<void> loadWishlist() async {
    emit(WishlistLoading());
    final result = await wishlistRepo.getWishlistMeals();
    result.fold(
      (failure) => emit(WishlistError(message: failure.toString())),
      (meals) async {
        await Prefs.saveWishlist(meals.map((e) => e.id.toInt()).toList());
        this.meals = meals;
        emit(WishlistLoaded());
      },
    );
  }

  Future<void> addMealToWishlist({required String name}) async {
    final result = await wishlistRepo.addMealToWishlist(name: name);
    result.fold(
      (failure) => emit(WishlistError(message: failure.toString())),
      (_) {
        emit(AddRemoveMealFromWishlistSuccess());
        return loadWishlist();
      },
    );
  }

  Future<void> removeMealFromWishlist({required String name}) async {
    final result = await wishlistRepo.removeMealFromWishlist(name: name);
    result.fold(
      (failure) => emit(WishlistError(message: failure.toString())),
      (_) {
        emit(AddRemoveMealFromWishlistSuccess());
        return loadWishlist();
      },
    );
  }

  bool inWishlist(int mealId) {
    var wishlist = Prefs.getWishlist();
    return wishlist.contains(mealId);
  }
}
