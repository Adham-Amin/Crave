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
  List<Product> cartItems = [];

  void addToCart({required Product cartItem, required MealEntity meal}) {
    final index = cartItems.indexWhere(
      (e) => e.productId == cartItem.productId,
    );

    if (index != -1) {
      cartItems[index].productQuantity =
          (cartItems[index].productQuantity ?? 0) + 1;

      cart[index].quantity++;
    } else {
      cartItems.add(cartItem);
      cart.add(meal);
    }

    emit(CartUpdate());
  }

  void removeFromCart({required Product cartItem, required MealEntity meal}) {
    cartItems.remove(cartItem);
    cart.remove(meal);
    emit(CartUpdate());
  }

  void clearCart() {
    cartItems.clear();
    cart.clear();
    emit(CartUpdate());
  }

  void updateCart({required Product cartItem}) {
    for (int i = 0; i < cartItems.length; i++) {
      if (cartItems[i].productId == cartItem.productId) {
        cartItems[i] = cartItem;
        break;
      }
    }
    emit(CartUpdate());
  }

  int discount = 0;

  int get totalPrice {
    final total = cartItems.fold(
      0,
      (sum, item) => sum + item.productUnitPrice! * item.productQuantity!,
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
    final result = await cartRepo.storeOrder(
      order: CartRequest(totalPrice: totalPrice, products: cartItems),
    );
    result.fold((l) => emit(CartError(message: l.message)), (r) {
      emit(CartSuccess());
    });
  }
}
