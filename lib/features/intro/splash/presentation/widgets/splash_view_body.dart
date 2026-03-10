import 'dart:async';

import 'package:crave/core/routing/app_routes.dart';
import 'package:crave/core/services/shared_preferences_service.dart';
import 'package:crave/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1, milliseconds: 500),
    )..repeat(reverse: true);

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    );

    waitAnimationAndNavigate();
    super.initState();
  }

  void waitAnimationAndNavigate() async {
    Timer(const Duration(seconds: 2), () {
      if (Prefs.getBool('SeenOnboarding')) {
        if (Prefs.getUser() != null) {
          context.go(AppRoutes.main);
        } else {
          context.go(AppRoutes.login);
        }
      } else {
        context.go(AppRoutes.onboarding);
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Image.asset(AppAssets.imagesLogo, width: 200.w, height: 200.w),
        ),
      ),
    );
  }
}
