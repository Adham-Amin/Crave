import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/features/cart/presentation/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: AppStyles.textBold24),
        centerTitle: true,
      ),
      body: const CartViewBody(),
    );
  }
}
