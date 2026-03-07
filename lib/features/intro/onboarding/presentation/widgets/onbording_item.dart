import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/features/intro/onboarding/data/model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnbordingItem extends StatelessWidget {
  const OnbordingItem({super.key, required this.onboardingitem});

  final OnboardingModel onboardingitem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(onboardingitem.image),
        const Spacer(),
        Text(
          onboardingitem.title,
          style: AppStyles.textBold24.copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}
