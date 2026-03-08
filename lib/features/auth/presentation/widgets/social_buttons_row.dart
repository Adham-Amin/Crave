import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crave/core/utils/app_assets.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/features/auth/presentation/widgets/social_button.dart';

class SocialButtonsRow extends StatelessWidget {
  const SocialButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 8.w,
          children: [
            Expanded(child: Divider(thickness: 1.2)),
            Text('Or', style: AppStyles.textRegular14),
            Expanded(child: Divider(thickness: 1.2)),
          ],
        ),
        SizedBox(height: 16.h),
        SocialButton(
          text: 'Login with Google',
          borderColor: AppColors.primary,
          iconPath: AppAssets.iconsLogosGoogleIcon,
          onPressed: () {},
        ),
        SizedBox(height: 16.h),
        SocialButton(
          text: 'Login with Facebook',
          iconPath: AppAssets.iconsLogosFacebook,
          onPressed: () {},
          backgroundColor: AppColors.facebookColor,
          textColor: AppColors.white,
        ),
      ],
    );
  }
}
