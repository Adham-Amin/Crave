import 'package:crave/core/utils/app_assets.dart';

class OnboardingModel {
  final String image;
  final String title;

  OnboardingModel({required this.image, required this.title});

  static List<OnboardingModel> onboardingList = [
    OnboardingModel(image: AppAssets.lottiesFood, title: 'We Cook'),
    OnboardingModel(image: AppAssets.lottiesFit, title: 'You Stay Fit'),
  ];
}
