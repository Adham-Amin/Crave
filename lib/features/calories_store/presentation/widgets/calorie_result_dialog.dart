import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

class CalorieResultDialog extends StatefulWidget {
  const CalorieResultDialog({
    super.key,
    required this.calories,
    required this.onSetPressed,
  });

  final num calories;
  final VoidCallback onSetPressed;

  @override
  State<CalorieResultDialog> createState() => _CalorieResultDialogState();
}

class _CalorieResultDialogState extends State<CalorieResultDialog>
    with TickerProviderStateMixin {
  late AnimationController _entranceController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  bool _startCountAnimation = false;

  @override
  void initState() {
    super.initState();
    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _entranceController,
      curve: Curves.easeOutBack,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _entranceController,
      curve: Curves.easeOut,
    );

    _entranceController.forward().then((_) {
      setState(() => _startCountAnimation = true);
    });
  }

  @override
  void dispose() {
    _entranceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Dialog(
          backgroundColor: AppColors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Container(
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                      'Your Calorie Intake',
                      style: AppStyles.textSemiBold20.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                40.hs,
                SizedBox(
                  width: 200.w,
                  height: 200.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        size: Size(200.w, 200.h),
                        painter: _CircularProgressPainter(),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'REMAINING',
                            style: AppStyles.textRegular14.copyWith(
                              color: AppColors.grey,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          _startCountAnimation
                              ? TweenAnimationBuilder<int>(
                                  tween: IntTween(
                                    begin: 0,
                                    end: widget.calories.toInt(),
                                  ),
                                  duration: const Duration(milliseconds: 1500),
                                  curve: Curves.easeOut,
                                  builder: (context, value, child) {
                                    return Text(
                                      value.toString(),
                                      style: AppStyles.textBold24.copyWith(
                                        color: AppColors.white,
                                        fontSize: 48.sp,
                                      ),
                                    );
                                  },
                                )
                              : Text(
                                  '0',
                                  style: AppStyles.textBold24.copyWith(
                                    color: AppColors.white,
                                    fontSize: 48.sp,
                                  ),
                                ),
                          Text(
                            'CAL',
                            style: AppStyles.textRegular14.copyWith(
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                Text(
                  'This Is Your Required Intake Of\nCalories Per Day',
                  textAlign: TextAlign.center,
                  style: AppStyles.textRegular16.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                SizedBox(height: 40.h),
                SizedBox(
                  width: double.infinity,
                  height: 60.h,
                  child: ElevatedButton(
                    onPressed: widget.onSetPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      'SET',
                      style: AppStyles.textMedium16.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final backgroundPaint = Paint()
      ..color = AppColors.darkGrey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    canvas.drawCircle(center, radius - 10, backgroundPaint);

    final progressPaint = Paint()
      ..color = AppColors.grey.withValues(alpha: 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 10),
      -math.pi / 2,
      math.pi * 1.5,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
