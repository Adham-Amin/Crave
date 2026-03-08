import 'package:crave/features/auth/presentation/widgets/verify_email_view_bod.dart';
import 'package:flutter/material.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: VerifyPhoneViewBody(email: email),
    );
  }
}
