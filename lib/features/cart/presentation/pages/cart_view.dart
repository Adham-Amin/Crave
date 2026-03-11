import 'package:crave/core/di/service_locator.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/features/cart/domain/repositories/cart_repo.dart';
import 'package:crave/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:crave/features/cart/presentation/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(cartRepo: getIt<CartRepo>()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          title: Text('Cart', style: AppStyles.textBold24),
          centerTitle: true,
        ),
        body: const CartViewBody(),
      ),
    );
  }
}
