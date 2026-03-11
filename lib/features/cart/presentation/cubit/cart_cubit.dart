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
    cartItems.add(cartItem);
    cart.add(meal);
  }

  void removeFromCart({required Product cartItem, required MealEntity meal}) {
    cartItems.remove(cartItem);
    cart.remove(meal);
  }

  void clearCart() {
    cartItems.clear();
    cart.clear();
  }

  void updateCart({required Product cartItem}) {
    for (int i = 0; i < cartItems.length; i++) {
      if (cartItems[i].productId == cartItem.productId) {
        cartItems[i] = cartItem;
      }
    }
  }

  Future<void> storeOrder() async {
    emit(CartLoading());
    final result = await cartRepo.storeOrder(
      order: CartRequest(
        totalPrice: cartItems
            .map((e) => e.productUnitPrice! * e.productQuantity!)
            .reduce((a, b) => a + b),
        products: cartItems,
      ),
    );
    result.fold(
      (l) => emit(CartError(message: l.message)),
      (r) => emit(CartSuccess()),
    );
  }
}
