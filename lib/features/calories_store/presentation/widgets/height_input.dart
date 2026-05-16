import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeightInput extends StatelessWidget {
  const HeightInput({
    super.key,
    required this.heightInCm,
    required this.onHeightChanged,
  });

  final int heightInCm;
  final ValueChanged<int> onHeightChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How tall are you ?',
          style: AppStyles.textRegular16.copyWith(color: AppColors.white),
        ),
        SizedBox(height: 16.h),
        GestureDetector(
          onTap: () => _showPicker(context),
          child: Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.darkGrey,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  heightInCm.toString(),
                  style: AppStyles.textMedium20.copyWith(
                    color: AppColors.white,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  'cm',
                  style: AppStyles.textRegular16.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showPicker(BuildContext context) {
    final scrollController = FixedExtentScrollController(
      initialItem: heightInCm - 100,
    );

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.darkGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => SizedBox(
        height: 300.h,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Text(
                'Select Height (cm)',
                style: AppStyles.textSemiBold18.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
            Expanded(
              child: ListWheelScrollView.useDelegate(
                controller: scrollController,
                itemExtent: 50.h,
                physics: const FixedExtentScrollPhysics(),
                onSelectedItemChanged: (index) {
                  onHeightChanged(index + 100);
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 151,
                  builder: (context, index) {
                    final cm = index + 100;
                    final isSelected = cm == heightInCm;
                    return Center(
                      child: Text(
                        '$cm cm',
                        style: AppStyles.textMedium18.copyWith(
                          color: isSelected ? AppColors.red : AppColors.white,
                          fontSize: isSelected ? 22.sp : 18.sp,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
