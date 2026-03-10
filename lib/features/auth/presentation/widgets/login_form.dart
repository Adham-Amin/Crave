import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:crave/core/functions/extentions.dart';
import 'package:crave/core/functions/validators.dart';
import 'package:crave/core/routing/app_routes.dart';
import 'package:crave/core/utils/app_colors.dart';
import 'package:crave/core/utils/app_styles.dart';
import 'package:crave/core/widgets/custom_button.dart';
import 'package:crave/core/widgets/custom_snack_bar.dart';
import 'package:crave/core/widgets/custom_text_form_field.dart';
import 'package:crave/core/widgets/custom_text_form_field_password.dart';
import 'package:crave/core/widgets/loading_dialog.dart';
import 'package:crave/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late TextEditingController emailController, passwordController;
  bool fieldsFilled = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            onChanged: (value) => setState(() {
              if (emailController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty) {
                fieldsFilled = true;
                setState(() {});
              } else {
                fieldsFilled = false;
                setState(() {});
              }
            }),
            controller: emailController,
            hintText: 'Email',
            validator: Validators.email,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icon(Icons.email_outlined),
          ),
          24.hs,
          CustomTextFormFieldPassword(
            onChanged: (value) {
              if (emailController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty) {
                fieldsFilled = true;
                setState(() {});
              } else {
                fieldsFilled = false;
                setState(() {});
              }
            },
            controller: passwordController,
            hintText: 'Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          24.hs,
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                context.push(AppRoutes.forgotPassword);
              },
              child: Text(
                'Forgot Password?',
                style: AppStyles.textBold16.copyWith(color: Colors.orange),
              ),
            ),
          ),
          32.hs,
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoading) {
                loadingDialog(context);
              }
              if (state is AuthSuccess) {
                context.go(AppRoutes.main);
                customSnackBar(
                  context: context,
                  message: 'Hello, ${state.user.name}',
                  type: AnimatedSnackBarType.success,
                );
              }
              if (state is AuthError) {
                context.pop();
                customSnackBar(
                  context: context,
                  message: state.message,
                  type: AnimatedSnackBarType.error,
                );
              }
            },
            child: CustomButton(
              title: 'LOGIN',
              backgroundColor: fieldsFilled ? AppColors.orange : null,
              onTap: !fieldsFilled
                  ? null
                  : () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context.read<AuthCubit>().login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
            ),
          ),
        ],
      ),
    );
  }
}
