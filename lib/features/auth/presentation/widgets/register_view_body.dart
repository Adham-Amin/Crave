import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/routing/app_routes.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/core/widgets/custom_rich_text.dart';
import 'package:crave/features/auth/presentation/widgets/register_form.dart';
import 'package:crave/features/auth/presentation/widgets/social_buttons_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          100.hs,
          Text('Create New Account ', style: AppStyles.textBold24),
          42.hs,
          RegisterForm(),
          32.hs,
          SocialButtonsRow(),
          32.hs,
          CustomRichText(
            text: 'Already have an account?',
            linkText: 'Login',
            onTap: () {
              context.pushReplacement(AppRoutes.login);
            },
          ),
          24.hs,
        ],
      ),
    );
  }
}
