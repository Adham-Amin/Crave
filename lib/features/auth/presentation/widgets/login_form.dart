import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/functions/validators.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/core/widgets/custom_button.dart';
import 'package:crave/core/widgets/custom_text_form_field.dart';
import 'package:crave/core/widgets/custom_text_form_field_password.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hintText: 'Email',
          validator: Validators.email,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icon(Icons.email_outlined),
        ),
        24.hs,
        CustomTextFormFieldPassword(
          hintText: 'Password',
          validator: Validators.password,
        ),
        24.hs,
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Forgot Password?',
            style: AppStyles.textBold16.copyWith(color: Colors.orange),
          ),
        ),
        32.hs,
        CustomButton(title: 'LOGIN', onTap: () {}),
      ],
    );
  }
}
