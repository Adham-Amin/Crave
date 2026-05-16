import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

class FourPersonTableWidget extends StatelessWidget {
  const FourPersonTableWidget({
    super.key,
    required this.tableNumber,
    required this.isSelected,
    required this.onTap,
  });

  final int tableNumber;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: isSelected
            ? BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.red.withValues(alpha: 0.1),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ],
              )
            : null,
        child: CustomPaint(
          size: Size(90.w, 90.w),
          painter: _FourPersonTablePainter(isSelected: isSelected),
          child: SizedBox(
            width: 90.w,
            height: 90.w,
            child: Center(
              child: Text(
                tableNumber.toString(),
                style: AppStyles.textBold18.copyWith(color: AppColors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FourPersonTablePainter extends CustomPainter {
  final bool isSelected;

  _FourPersonTablePainter({required this.isSelected});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final tableSize = size.width * 0.32;
    final chairSize = size.width * 0.18;

    final tablePaint = Paint()
      ..color = isSelected ? AppColors.red : const Color(0xFF3A3A3D);

    final chairPaint = Paint()
      ..color = isSelected
          ? AppColors.red.withValues(alpha: 0.6)
          : const Color(0xFF4A4A4D);

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(math.pi / 4);

    final tableRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset.zero, width: tableSize, height: tableSize),
      Radius.circular(tableSize * 0.15),
    );
    canvas.drawRRect(tableRect, tablePaint);

    canvas.restore();

    final chairOffset = size.width * 0.35;
    final positions = [
      Offset(center.dx, center.dy - chairOffset),
      Offset(center.dx + chairOffset, center.dy),
      Offset(center.dx, center.dy + chairOffset),
      Offset(center.dx - chairOffset, center.dy),
    ];

    for (final pos in positions) {
      canvas.drawOval(
        Rect.fromCenter(center: pos, width: chairSize, height: chairSize),
        chairPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _FourPersonTablePainter oldDelegate) =>
      oldDelegate.isSelected != isSelected;
}

class SixPersonTableWidget extends StatelessWidget {
  const SixPersonTableWidget({
    super.key,
    required this.tableNumber,
    required this.isSelected,
    required this.onTap,
  });

  final int tableNumber;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: isSelected
            ? BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.red.withValues(alpha: 0.1),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ],
              )
            : null,
        child: CustomPaint(
          size: Size(90.w, 110.w),
          painter: _SixPersonTablePainter(isSelected: isSelected),
          child: SizedBox(
            width: 90.w,
            height: 110.w,
            child: Center(
              child: Text(
                tableNumber.toString(),
                style: AppStyles.textBold18.copyWith(color: AppColors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SixPersonTablePainter extends CustomPainter {
  final bool isSelected;

  _SixPersonTablePainter({required this.isSelected});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final tableWidth = size.width * 0.5;
    final tableHeight = size.height * 0.45;
    final chairSize = size.width * 0.17;

    final tablePaint = Paint()
      ..color = isSelected ? AppColors.red : const Color(0xFF3A3A3D);

    final chairPaint = Paint()
      ..color = isSelected
          ? AppColors.red.withValues(alpha: 0.6)
          : const Color(0xFF4A4A4D);

    final tableRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: center, width: tableWidth, height: tableHeight),
      Radius.circular(tableWidth * 0.15),
    );
    canvas.drawRRect(tableRect, tablePaint);

    final topY = center.dy - tableHeight / 2 - chairSize * 0.7;
    final bottomY = center.dy + tableHeight / 2 + chairSize * 0.7;
    final leftX = center.dx - tableWidth * 0.35;
    final rightX = center.dx + tableWidth * 0.35;

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(leftX, topY),
        width: chairSize,
        height: chairSize,
      ),
      chairPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(rightX, topY),
        width: chairSize,
        height: chairSize,
      ),
      chairPaint,
    );

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(leftX, bottomY),
        width: chairSize,
        height: chairSize,
      ),
      chairPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(rightX, bottomY),
        width: chairSize,
        height: chairSize,
      ),
      chairPaint,
    );

    final middleLeftX = center.dx - tableWidth / 2 - chairSize * 0.7;
    final middleRightX = center.dx + tableWidth / 2 + chairSize * 0.7;

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(middleLeftX, center.dy),
        width: chairSize,
        height: chairSize,
      ),
      chairPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(middleRightX, center.dy),
        width: chairSize,
        height: chairSize,
      ),
      chairPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _SixPersonTablePainter oldDelegate) =>
      oldDelegate.isSelected != isSelected;
}
