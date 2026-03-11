import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/functions/navigate_to_tab.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/core/widgets/custom_button.dart';
import 'package:crave/core/widgets/custom_snack_bar.dart';
import 'package:crave/core/widgets/custom_text_form_field.dart';
import 'package:crave/core/widgets/loading_dialog.dart';
import 'package:crave/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:crave/features/cart/presentation/widgets/meal_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartCubit>().cart;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: cart.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.remove_shopping_cart_outlined, size: 100.r),
                24.hs,
                Center(
                  child: Text(
                    'Your cart is empty',
                    style: AppStyles.textRegular16,
                  ),
                ),
                24.hs,
                CustomButton(
                  title: 'Continue Shopping',
                  onTap: () {
                    navigateToTab(context, 0);
                  },
                ),
              ],
            )
          : Column(
              children: [
                24.hs,
                Expanded(
                  child: BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      return ListView.separated(
                        itemCount: cart.length,
                        separatorBuilder: (context, index) => 16.hs,
                        itemBuilder: (context, index) =>
                            MealCartItem(meal: cart[index]),
                      );
                    },
                  ),
                ),
                24.hs,
                CustomTextFormField(
                  hintText: 'Promo Code',
                  prefixIcon: const Icon(Icons.vpn_key),
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {
                    if (value.isNotEmpty) {
                      context.read<CartCubit>().applyPromo(int.parse(value));
                    }
                  },
                ),
                16.hs,
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: AppColors.darkGrey,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Total:',
                        style: AppStyles.textRegular16.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      8.ws,
                      Expanded(child: Divider(color: AppColors.white)),
                      8.ws,
                      BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          return Text(
                            '\$${context.watch<CartCubit>().totalPrice}',
                            style: AppStyles.textSemiBold16.copyWith(
                              color: AppColors.white,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                16.hs,
                BlocListener<CartCubit, CartState>(
                  listener: (context, state) {
                    if (state is CartLoading) {
                      loadingDialog(context);
                    }
                    if (state is CartSuccess) {
                      context.read<CartCubit>().clearCart();
                      context.pop();
                      navigateToTab(context, 0);
                      customSnackBar(
                        context: context,
                        message: 'Order placed successfully',
                        type: AnimatedSnackBarType.success,
                      );
                    }
                    if (state is CartError) {
                      context.pop();
                      customSnackBar(
                        context: context,
                        message: state.message,
                        type: AnimatedSnackBarType.error,
                      );
                    }
                  },
                  child: CustomButton(
                    title: 'Checkout',
                    onTap: () {
                      context.read<CartCubit>().storeOrder();
                    },
                  ),
                ),
                24.hs,
              ],
            ),
    );
  }
}
