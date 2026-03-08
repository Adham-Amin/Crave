import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/routing/app_routes.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/core/widgets/custom_rich_text.dart';
import 'package:crave/features/auth/presentation/widgets/login_form.dart';
import 'package:crave/features/auth/presentation/widgets/social_buttons_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          100.hs,
          Text('Welcome Back', style: AppStyles.textBold24),
          42.hs,
          LoginForm(),
          32.hs,
          const SocialButtonsRow(),
          32.hs,
          CustomRichText(
            text: 'Don’t have an account?',
            linkText: 'Sign Up',
            onTap: () {
              context.pushReplacement(AppRoutes.register);
            },
          ),
          24.hs,
        ],
      ),
    );
  }
}
