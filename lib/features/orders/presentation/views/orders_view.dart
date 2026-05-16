import 'package:crave/core/di/service_locator.dart';
import 'package:crave/features/orders/domain/repositories/order_repo.dart';
import 'package:crave/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:crave/features/orders/presentation/widgets/orders_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OrdersCubit(orderRepo: getIt<OrderRepo>())..getOrdersHistory(),
      child: Scaffold(appBar: AppBar(), body: OrdersViewBody()),
    );
  }
}
