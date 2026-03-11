import 'package:crave/features/cart/data/models/cart_request/cart_request.dart';
import 'package:crave/features/cart/domain/repositories/cart_repo.dart';
import 'package:crave/features/home/domain/entities/meal_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.cartRepo}) : super(CartInitial());

  final CartRepo cartRepo;

  List<MealEntity> cartItems = [];

  void addToCart({required MealEntity cartItem}) {
    cartItems.add(cartItem);
  }

  void removeFromCart({required MealEntity cartItem}) {
    cartItems.remove(cartItem);
  }

  void clearCart() {
    cartItems.clear();
  }

  void updateCart({required MealEntity cartItem, required int index}) {
    cartItems[index] = cartItem;
  }

  Future<void> storeOrder({required CartRequest order}) async {
    emit(CartLoading());
    final result = await cartRepo.storeOrder(order: order);
    result.fold(
      (l) => emit(CartError(message: l.message)),
      (r) => emit(CartSuccess()),
    );
  }
}
