import 'package:crave/core/routing/app_routes.dart';
import 'package:crave/features/auth/presentation/pages/forgot_password_view.dart';
import 'package:crave/features/auth/presentation/pages/login_view.dart';
import 'package:crave/features/auth/presentation/pages/register_view.dart';
import 'package:crave/features/auth/presentation/pages/reset_password_view.dart';
import 'package:crave/features/auth/presentation/pages/verify_phone_view.dart';
import 'package:crave/features/intro/onboarding/presentation/view/onboarding_view.dart';
import 'package:crave/features/intro/splash/presentation/views/splash_view.dart';
import 'package:crave/features/main/main_view.dart';
import 'package:crave/features/meals/presentation/pages/meals_view.dart';
import 'package:go_router/go_router.dart';

class RouterGenerationConfig {
  static GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        name: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.login,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppRoutes.register,
        name: AppRoutes.register,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        name: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        path: AppRoutes.verifyEmail,
        name: AppRoutes.verifyEmail,
        builder: (context, state) =>
            VerifyEmailView(email: state.extra as String),
      ),
      GoRoute(
        path: AppRoutes.resetPassword,
        name: AppRoutes.resetPassword,
        builder: (context, state) =>
            ResetPasswordView(email: state.extra as String),
      ),
      GoRoute(
        path: AppRoutes.main,
        name: AppRoutes.main,
        builder: (context, state) => MainView(key: MainView.mainViewKey),
      ),
      GoRoute(
        path: AppRoutes.meals,
        name: AppRoutes.meals,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          return MealsView(meals: args['meals'], title: args['title']);
        },
      ),
    ],
  );
}
