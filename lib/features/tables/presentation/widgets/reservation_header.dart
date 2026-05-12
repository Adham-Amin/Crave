import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReservationHeader extends StatelessWidget {
  const ReservationHeader({
    super.key,
    required this.userName,
  });

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello, $userName',
          style: AppStyles.textRegular16.copyWith(
            color: AppColors.grey,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Reserve A Table\nAt Pargon',
          style: AppStyles.textBold24.copyWith(
            color: AppColors.white,
            fontSize: 32.sp,
          ),
        ),
      ],
    );
  }
}
