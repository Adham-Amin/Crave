import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/features/orders/domain/entities/order_entity.dart';
import 'package:crave/features/orders/presentation/widgets/order_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({super.key, required this.order});

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: AppColors.orange.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.receipt_long_rounded,
                    color: AppColors.orange,
                    size: 22.r,
                  ),
                ),
                12.ws,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order',
                        style: AppStyles.textSemiBold16.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      4.hs,
                      Text(
                        order.date,
                        style: AppStyles.textRegular14.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    '\$${order.totalPrice}',
                    style: AppStyles.textBold14.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.grey.withValues(alpha: 0.2), height: 1),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(12.r),
            itemCount: order.products.length,
            separatorBuilder: (_, _) => 8.hs,
            itemBuilder: (context, index) =>
                OrderProductTile(meal: order.products[index]),
          ),
        ],
      ),
    );
  }
}
