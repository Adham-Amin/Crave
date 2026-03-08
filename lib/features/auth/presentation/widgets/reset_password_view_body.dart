import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/functions/validators.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/core/widgets/custom_button.dart';
import 'package:crave/core/widgets/custom_text_form_field_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key, required this.email});

  final String email;

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late TextEditingController _passController, _confirmPassController;

  @override
  void initState() {
    _passController = TextEditingController();
    _confirmPassController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _passController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentGeometry.center,
              child: Icon(
                Icons.lock_outline,
                color: Color(0xffAFAFAF),
                size: 32.w,
              ),
            ),
            24.hs,
            Align(
              alignment: AlignmentGeometry.center,
              child: Text('Set New Password', style: AppStyles.textSemiBold18),
            ),
            16.hs,
            Text(
              'Your New Password Must be Different to Previously Used Password',
              textAlign: TextAlign.center,
              style: AppStyles.textRegular14.copyWith(color: AppColors.grey),
            ),
            32.hs,
            Text('Password', style: AppStyles.textRegular14),
            4.hs,
            CustomTextFormFieldPassword(
              hintText: '********',
              validator: Validators.password,
              controller: _passController,
            ),
            16.hs,
            Text('Confirm Password', style: AppStyles.textRegular14),
            4.hs,
            CustomTextFormFieldPassword(
              hintText: '********',
              controller: _confirmPassController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != _passController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            16.hs,
            CustomButton(
              title: 'Reset Password',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  // todo
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
