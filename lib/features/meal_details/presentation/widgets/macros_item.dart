import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MacrosItem extends StatelessWidget {
  const MacrosItem({super.key, required this.label, required this.value});

  final String label;
  final num value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.darkGrey,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Text(value.toString(), style: AppStyles.textSemiBold20),
          ),
          16.hs,
          Text(label, style: AppStyles.textBold16),
          16.hs,
        ],
      ),
    );
  }
}
