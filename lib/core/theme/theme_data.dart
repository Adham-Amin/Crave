import 'package:crave/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_transitions/go_transitions.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: GoTransitions.slide.toTop.withFade,
        TargetPlatform.iOS: GoTransitions.slide.toTop.withFade,
      },
    ),
    fontFamily: AppStyles.fontFamily,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: const BorderSide(color: Colors.orange),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: const BorderSide(color: Colors.red),
      ),
    ),
  );
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: GoTransitions.slide.toTop.withFade,
        TargetPlatform.iOS: GoTransitions.slide.toTop.withFade,
      },
    ),
    fontFamily: AppStyles.fontFamily,
  );
}
