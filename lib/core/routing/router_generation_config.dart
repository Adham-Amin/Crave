import 'package:crave/core/routing/app_routes.dart';
import 'package:crave/features/auth/presentation/pages/login_view.dart';
import 'package:crave/features/auth/presentation/pages/register_view.dart';
import 'package:crave/features/intro/onboarding/presentation/view/onboarding_view.dart';
import 'package:crave/features/intro/splash/presentation/views/splash_view.dart';
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
    ],
  );
}
