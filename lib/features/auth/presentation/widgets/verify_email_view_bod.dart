import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/routing/app_routes.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/core/widgets/custom_button.dart';
import 'package:crave/core/widgets/custom_rich_text.dart';
import 'package:crave/core/widgets/custom_snack_bar.dart';
import 'package:crave/features/auth/presentation/widgets/pin_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class VerifyPhoneViewBody extends StatefulWidget {
  const VerifyPhoneViewBody({super.key, required this.email});

  final String email;

  @override
  State<VerifyPhoneViewBody> createState() => _VerifyPhoneViewBodyState();
}

class _VerifyPhoneViewBodyState extends State<VerifyPhoneViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Icon(Icons.email_outlined, color: Color(0xffAFAFAF), size: 32.w),
            24.hs,
            Text('Verify Code', style: AppStyles.textSemiBold18),
            16.hs,
            Text(
              'Please enter the code we just sent to phone\n(${widget.email})',
              textAlign: TextAlign.center,
              style: AppStyles.textRegular14.copyWith(color: AppColors.grey),
            ),
            32.hs,
            PinSection(onCompleted: (code) {}),
            16.hs,
            CustomRichText(
              text: 'OTP not receive ? ',
              linkText: 'Send again',
              onTap: () {
                customSnackBar(
                  context: context,
                  message: 'Successfully Send again',
                  type: AnimatedSnackBarType.success,
                );
                setState(() {});
              },
            ),
            16.hs,
            CustomButton(
              title: 'Verify',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  // todo
                  context.pushReplacement(
                    AppRoutes.resetPassword,
                    extra: widget.email,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
