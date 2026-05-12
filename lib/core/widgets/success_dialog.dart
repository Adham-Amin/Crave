import 'package:crave/core/functions/navigate_to_tab.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(32.w),
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    navigateToTab(context, 0);
                  },
                  child: Icon(
                    Icons.close,
                    color: AppColors.white,
                    size: 24.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              width: 120.w,
              height: 120.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF5CB85C),
                    Color(0xFF4A9D8E),
                  ],
                ),
              ),
              child: Icon(
                Icons.check,
                color: AppColors.white,
                size: 60.sp,
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'Done',
              style: AppStyles.textBold24.copyWith(
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppStyles.textRegular16.copyWith(
                color: AppColors.grey,
              ),
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
