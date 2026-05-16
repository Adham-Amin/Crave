import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyOrdersWidget extends StatelessWidget {
  const EmptyOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.receipt_long_outlined, size: 100.r, color: AppColors.grey),
          24.hs,
          Text('No orders yet', style: AppStyles.textSemiBold20),
          8.hs,
          Text(
            'Your order history will appear here',
            style: AppStyles.textRegular14.copyWith(color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}
