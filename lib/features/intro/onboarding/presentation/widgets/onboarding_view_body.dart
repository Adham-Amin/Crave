import 'package:crave/core/routing/app_routes.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/features/intro/onboarding/data/model/onboarding_model.dart';
import 'package:crave/features/intro/onboarding/presentation/widgets/button_onboarding.dart';
import 'package:crave/features/intro/onboarding/presentation/widgets/onbording_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: currentPage != 1,
          maintainAnimation: true,
          maintainState: true,
          maintainSize: true,
          child: Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {
                context.push(AppRoutes.login);
              },
              child: Text(
                'Skip',
                style: AppStyles.textBold20.copyWith(color: AppColors.white),
              ),
            ),
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 6,
          child: PageView.builder(
            controller: _pageController,
            itemCount: OnboardingModel.onboardingList.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return OnbordingItem(
                onboardingitem: OnboardingModel.onboardingList[index],
              );
            },
          ),
        ),
        const Spacer(flex: 2),
        ButtonOnboarding(
          currentPage: currentPage,
          pageController: _pageController,
        ),
        const Spacer(),
      ],
    );
  }
}
