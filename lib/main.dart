import 'package:flutter/material.dart';

void main() {
  runApp(const Crave());
}

class Crave extends StatelessWidget {
  const Crave({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
    );
  }
}
