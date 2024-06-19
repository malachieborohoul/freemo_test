import 'package:flutter/material.dart';
import 'package:freemo_test/constants/color.dart';
import 'package:freemo_test/features/intro/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
          useMaterial3: true,
          primaryColor: AppColors.primary,
        ),
      home: const SplashScreen(),
    );
  }
}
