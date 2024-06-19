
import 'package:flutter/material.dart';
import 'package:freemo_test/features/auth/screens/login_screen.dart';
import 'package:freemo_test/features/auth/screens/register_screen.dart';
import 'package:freemo_test/features/auth/screens/verification_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {


    case RegisterScreen.routeName:
      return PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const RegisterScreen(),
        );
      });

    case LoginScreen.routeName:
      return PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: LoginScreen(),
        );
      });


    case VerificationScreen.routeName:
      return PageRouteBuilder(pageBuilder: (_, animation, __) {
        var email = routeSettings.arguments as String;
        return FadeTransition(
          opacity: animation,
          child: VerificationScreen(
            email: email,
          ),
        );
      });


    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text("404"),
                ),
              ));
  }
}
