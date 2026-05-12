import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoalSelector extends StatelessWidget {
  const GoalSelector({
    super.key,
    required this.selectedGoal,
    required this.onGoalChanged,
  });

  final String selectedGoal;
  final ValueChanged<String> onGoalChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Goal in maintaining your weight?',
          style: AppStyles.textRegular16.copyWith(color: AppColors.white),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: _GoalButton(
                label: 'Lose weight',
                isSelected: selectedGoal == 'lose',
                onTap: () => onGoalChanged('lose'),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _GoalButton(
                label: 'Maintain',
                isSelected: selectedGoal == 'Maintain weight',
                onTap: () => onGoalChanged('Maintain weight'),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _GoalButton(
                label: 'Gain weight',
                isSelected: selectedGoal == 'gain',
                onTap: () => onGoalChanged('gain'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _GoalButton extends StatelessWidget {
  const _GoalButton({
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
