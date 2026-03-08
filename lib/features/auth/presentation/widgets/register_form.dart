import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/functions/validators.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/widgets/custom_button.dart';
import 'package:crave/core/widgets/custom_text_form_field.dart';
import 'package:crave/core/widgets/custom_text_form_field_password.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  bool fieldsFilled = false;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void checkFields() {
    setState(() {
      fieldsFilled =
          nameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          phoneController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          confirmPasswordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            controller: nameController,
            hintText: 'Full Name',
            validator: Validators.name,
            keyboardType: TextInputType.text,
            prefixIcon: const Icon(Icons.person_2_outlined),
            onChanged: (_) => checkFields(),
          ),
          24.hs,
          CustomTextFormField(
            controller: emailController,
            hintText: 'Email',
            validator: Validators.email,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: const Icon(Icons.email_outlined),
            onChanged: (_) => checkFields(),
          ),
          24.hs,
          CustomTextFormField(
            controller: phoneController,
            hintText: 'Phone',
            validator: Validators.phone,
            keyboardType: TextInputType.phone,
            prefixIcon: const Icon(Icons.phone_outlined),
            onChanged: (_) => checkFields(),
          ),
          24.hs,
          CustomTextFormFieldPassword(
            controller: passwordController,
            hintText: 'Password',
            validator: Validators.password,
            onChanged: (_) => checkFields(),
          ),
          24.hs,
          CustomTextFormFieldPassword(
            controller: confirmPasswordController,
            hintText: 'Confirm Password',
            validator: (value) {
              if (value != passwordController.text) {
                return 'Password does not match';
              }
              return null;
            },
            onChanged: (_) => checkFields(),
          ),
          32.hs,
          CustomButton(
            title: 'SIGN UP',
            backgroundColor: fieldsFilled ? AppColors.orange : Colors.grey,
            onTap: fieldsFilled
                ? () {
                    if (formKey.currentState!.validate()) {
                      // register logic
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
