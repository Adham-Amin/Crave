import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor = AppColors.orange,
    this.titleColor = AppColors.white,
    this.showArrow = true,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color iconColor;
  final Color titleColor;
  final bool showArrow;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(icon, color: iconColor, size: 22.r),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Text(
                title,
                style: AppStyles.textMedium16.copyWith(color: titleColor),
              ),
            ),
            if (showArrow)
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.grey,
                size: 16.r,
              ),
          ],
        ),
      ),
    );
  }
}
