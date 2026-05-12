import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeSelector extends StatelessWidget {
  const TimeSelector({
    super.key,
    required this.selectedTime,
    required this.onTimeChanged,
  });

  final String? selectedTime;
  final ValueChanged<String> onTimeChanged;

  static const List<String> _timeSlots = [
    '6:30AM', '7:00AM', '7:30AM', '8:00AM',
    '8:30AM', '9:00AM', '9:30AM', '10:00AM',
    '10:30AM', '11:00AM', '11:30AM', '12:00PM',
    '12:30PM', '1:00PM', '1:30PM', '2:00PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose A Time For Reservation',
          style: AppStyles.textRegular14.copyWith(
            color: AppColors.grey,
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 50.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _timeSlots.length,
            itemBuilder: (context, index) {
              final time = _timeSlots[index];
              final isSelected = selectedTime == time;
              return _TimeItem(
                time: time,
                isSelected: isSelected,
                onTap: () => onTimeChanged(time),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _TimeItem extends StatelessWidget {
  const _TimeItem({
    required this.time,
    required this.isSelected,
    required this.onTap,
  });

  final String time;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        margin: EdgeInsets.only(right: 12.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.red : AppColors.darkGrey,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            time,
            style: AppStyles.textMedium16.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
