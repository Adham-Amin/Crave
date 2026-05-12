import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivitySelector extends StatelessWidget {
  const ActivitySelector({
    super.key,
    required this.selectedActivity,
    required this.onActivityChanged,
  });

  final String selectedActivity;
  final ValueChanged<String> onActivityChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How active are you on daily basis ?',
          style: AppStyles.textRegular16.copyWith(color: AppColors.white),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: _ActivityButton(
                label: 'Less active',
                isSelected: selectedActivity == 'less',
                onTap: () => onActivityChanged('less'),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _ActivityButton(
                label: 'Moderate active',
                isSelected: selectedActivity == 'moderate',
                onTap: () => onActivityChanged('moderate'),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _ActivityButton(
                label: 'Very active',
                isSelected: selectedActivity == 'very',
                onTap: () => onActivityChanged('very'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ActivityButton extends StatelessWidget {
  const _ActivityButton({
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
            textAlign: TextAlign.center,
            style: AppStyles.textRegular14.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
