import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/core/widgets/custom_error.dart';
import 'package:crave/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:crave/features/orders/presentation/widgets/empty_orders_widget.dart';
import 'package:crave/features/orders/presentation/widgets/order_item_card.dart';
import 'package:crave/features/orders/presentation/widgets/orders_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('My Orders', style: AppStyles.textBold24),
            4.hs,
            Text(
              'Track your order history',
              style: AppStyles.textRegular14.copyWith(color: AppColors.grey),
            ),
            24.hs,
            Expanded(
              child: BlocBuilder<OrdersCubit, OrdersState>(
                builder: (context, state) {
                  if (state is OrdersLoading) {
                    return const OrdersShimmer();
                  }
                  if (state is OrdersError) {
                    return CustomError(message: state.message);
                  }
                  if (state is OrdersSuccess) {
                    if (state.orders.isEmpty) {
                      return const EmptyOrdersWidget();
                    }
                    return RefreshIndicator(
                      color: AppColors.orange,
                      onRefresh: () =>
                          context.read<OrdersCubit>().getOrdersHistory(),
                      child: ListView.separated(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: state.orders.length,
                        separatorBuilder: (_, _) => 16.hs,
                        itemBuilder: (context, index) =>
                            OrderItemCard(order: state.orders[index]),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
