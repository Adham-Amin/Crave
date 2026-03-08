import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/functions/validators.dart';
import 'package:crave/core/widgets/custom_button.dart';
import 'package:crave/core/widgets/custom_text_form_field.dart';
import 'package:crave/core/widgets/custom_text_form_field_password.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hintText: 'Full Name',
          validator: Validators.name,
          keyboardType: TextInputType.text,
          prefixIcon: Icon(Icons.person_2_outlined),
        ),
        24.hs,
        CustomTextFormField(
          hintText: 'Email',
          validator: Validators.email,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icon(Icons.email_outlined),
        ),
        24.hs,
        CustomTextFormField(
          hintText: 'Phone',
          validator: Validators.phone,
          keyboardType: TextInputType.phone,
          prefixIcon: Icon(Icons.phone_outlined),
        ),
        24.hs,
        CustomTextFormFieldPassword(
          hintText: 'Password',
          validator: Validators.password,
        ),
        24.hs,
        CustomTextFormFieldPassword(
          hintText: 'Confirm Password',
          validator: Validators.password,
        ),
        32.hs,
        CustomButton(title: 'SIGN IN', onTap: () {}),
      ],
    );
  }
}
