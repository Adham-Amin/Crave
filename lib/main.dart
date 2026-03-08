import 'package:crave/core/routing/router_generation_config.dart';
import 'package:crave/core/services/shared_preferences_service.dart';
import 'package:crave/core/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Prefs.init();
  runApp(const Crave());
}

class Crave extends StatelessWidget {
  const Crave({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        routerConfig: RouterGenerationConfig.router,
      ),
    );
  }
}
