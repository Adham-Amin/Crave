import 'package:crave/core/routing/app_routes.dart';
import 'package:crave/core/services/shared_preferences_service.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ButtonOnboarding extends StatelessWidget {
  const ButtonOnboarding({
    super.key,
    required this.currentPage,
    required PageController pageController,
  }) : _pageController = pageController;

  final int currentPage;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (currentPage == 1) {
          context.push(AppRoutes.login);
          await Prefs.setBool('SeenOnboarding', true);
        } else {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 194, 81, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        minimumSize: Size(double.infinity, 50.h),
      ),
      child: Text(
        currentPage == 1 ? 'Get Started' : 'Next',
        style: AppStyles.textBold20.copyWith(color: AppColors.white),
      ),
    );
  }
}
