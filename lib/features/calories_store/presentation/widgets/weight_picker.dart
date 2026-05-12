import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeightPicker extends StatelessWidget {
  const WeightPicker({
    super.key,
    required this.selectedWeight,
    required this.onWeightChanged,
  });

  final int selectedWeight;
  final ValueChanged<int> onWeightChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How much do you weigh in kg ?',
          style: AppStyles.textRegular16.copyWith(color: AppColors.white),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 60.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 156,
            itemBuilder: (context, index) {
              final weight = index + 45;
              final isSelected = weight == selectedWeight;
              return GestureDetector(
                onTap: () => onWeightChanged(weight),
                child: Container(
                  width: 60.w,
                  margin: EdgeInsets.only(right: 12.w),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.red : AppColors.darkGrey,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      weight.toString(),
                      style: AppStyles.textMedium18.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
