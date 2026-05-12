import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderSelector extends StatelessWidget {
  const GenderSelector({
    super.key,
    required this.selectedGender,
    required this.onGenderChanged,
  });

  final String selectedGender;
  final ValueChanged<String> onGenderChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select your gender',
          style: AppStyles.textRegular16.copyWith(color: AppColors.white),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: _GenderButton(
                label: 'Male',
                isSelected: selectedGender == 'male',
                onTap: () => onGenderChanged('male'),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _GenderButton(
                label: 'Female',
                isSelected: selectedGender == 'female',
                onTap: () => onGenderChanged('female'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _GenderButton extends StatelessWidget {
  const _GenderButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.red : AppColors.darkGrey,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            label,
            style: AppStyles.textMedium16.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
