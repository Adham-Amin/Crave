import 'package:crave/core/di/service_locator.dart';
import 'package:crave/features/auth/domain/repositories/auth_repo.dart';
import 'package:crave/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:crave/features/auth/presentation/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(body: SafeArea(child: const LoginViewBody())),
    );
  }
}
