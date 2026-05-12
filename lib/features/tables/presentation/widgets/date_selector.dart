import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({
    super.key,
    required this.selectedDate,
    required this.onDateChanged,
  });

  final DateTime? selectedDate;
  final ValueChanged<DateTime> onDateChanged;

  List<DateTime> _generateDates() {
    final now = DateTime.now();
    return List.generate(7, (index) => now.add(Duration(days: index)));
  }

  String _getDateRange() {
    final dates = _generateDates();
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[dates.first.month - 1]} ${dates.first.day} - ${dates.last.day}';
  }

  String _getDayName(DateTime date) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[date.weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    final dates = _generateDates();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Select The Date For Reservation',
              style: AppStyles.textRegular14.copyWith(
                color: AppColors.grey,
              ),
            ),
            Row(
              children: [
                Text(
                  _getDateRange(),
                  style: AppStyles.textRegular14.copyWith(
                    color: AppColors.white,
                  ),
                ),
                SizedBox(width: 8.w),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.white,
                  size: 14.sp,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 70.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dates.length,
            itemBuilder: (context, index) {
              final date = dates[index];
              final isSelected = selectedDate?.day == date.day &&
                  selectedDate?.month == date.month;
              return _DateItem(
                date: date,
                dayName: _getDayName(date),
                isSelected: isSelected,
                onTap: () => onDateChanged(date),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _DateItem extends StatelessWidget {
  const _DateItem({
    required this.date,
    required this.dayName,
    required this.isSelected,
    required this.onTap,
  });

  final DateTime date;
  final String dayName;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date.day.toString(),
              style: AppStyles.textBold20.copyWith(
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              dayName,
              style: AppStyles.textRegular14.copyWith(
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
