import 'package:crave/features/cart/data/models/cart_request/cart_request.dart';
import 'package:crave/features/cart/data/models/cart_request/product.dart';
import 'package:crave/features/cart/domain/repositories/cart_repo.dart';
import 'package:crave/features/home/domain/entities/meal_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.cartRepo}) : super(CartInitial());

  final CartRepo cartRepo;

  List<MealEntity> cart = [];

  void addToCart({required MealEntity meal}) {
    final index = cart.indexWhere((e) => e.id == meal.id);

    if (index != -1) {
      cart[index].quantity++;
    } else {
      cart.add(meal);
    }

    emit(CartUpdate());
  }

  void removeFromCart({required MealEntity meal}) {
    cart.removeWhere((e) => e.id == meal.id);
    emit(CartUpdate());
  }

  void clearCart() {
    cart.clear();
    emit(CartUpdate());
  }

  void increaseQuantity(MealEntity meal) {
    final index = cart.indexWhere((e) => e.id == meal.id);
    if (index != -1) {
      cart[index].quantity++;
      emit(CartUpdate());
    }
  }

  void decreaseQuantity(MealEntity meal) {
    final index = cart.indexWhere((e) => e.id == meal.id);

    if (index != -1) {
      if (cart[index].quantity > 1) {
        cart[index].quantity--;
      } else {
        cart.removeAt(index);
      }

      emit(CartUpdate());
    }
  }

  int discount = 0;

  int get totalPrice {
    final total = cart.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity).toInt(),
    );

    final result = total - discount;

    return result < 0 ? 0 : result;
  }

  void applyPromo(int value) {
    discount = value;
    emit(CartUpdate());
  }

  Future<void> storeOrder() async {
    emit(CartLoading());

    final products = cart
        .map(
          (e) => Product(
            productId: e.id.toInt(),
            productQuantity: e.quantity.toInt(),
            productUnitPrice: e.price.toInt(),
          ),
        )
        .toList();

    final result = await cartRepo.storeOrder(
      order: CartRequest(totalPrice: totalPrice, products: products),
    );

    result.fold(
      (l) => emit(CartError(message: l.message)),
      (r) => emit(CartSuccess()),
    );
  }
}
