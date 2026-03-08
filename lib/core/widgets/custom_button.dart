import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.backgroundColor = AppColors.orange,
    this.colorText,
    this.isLoading = false,
  });

  final String title;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? colorText;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: colorText == null
                ? BorderSide.none
                : BorderSide(color: colorText!),
          ),
        ),
        child: isLoading
            ? Padding(
                padding: const EdgeInsets.all(12),
                child: Center(
                  child: CircularProgressIndicator(
                    color: colorText ?? AppColors.white,
                  ),
                ),
              )
            : Text(
                title,
                style: AppStyles.textMedium16.copyWith(
                  color: colorText ?? AppColors.white,
                ),
              ),
      ),
    );
  }
}
