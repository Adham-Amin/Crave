import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PeopleSelector extends StatelessWidget {
  const PeopleSelector({
    super.key,
    required this.selectedNumber,
    required this.onNumberChanged,
  });

  final int? selectedNumber;
  final ValueChanged<int> onNumberChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Number Of People',
          style: AppStyles.textRegular14.copyWith(color: AppColors.grey),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 50.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (context, index) {
              final number = index + 2;
              final isSelected = selectedNumber == number;
              return _PeopleItem(
                number: number,
                isSelected: isSelected,
                onTap: () => onNumberChanged(number),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _PeopleItem extends StatelessWidget {
  const _PeopleItem({
    required this.number,
    required this.isSelected,
    required this.onTap,
  });

  final int number;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50.w,
        margin: EdgeInsets.only(right: 12.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.red : AppColors.darkGrey,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            number.toString(),
            style: AppStyles.textBold18.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
