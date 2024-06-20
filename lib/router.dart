
import 'package:flutter/material.dart';
import 'package:freemo_test/features/auth/screens/login_screen.dart';
import 'package:freemo_test/features/auth/screens/register_screen.dart';
import 'package:freemo_test/features/auth/screens/search_countries_sreen.dart';
import 'package:freemo_test/features/auth/screens/verification_screen.dart';
import 'package:freemo_test/features/dashboard/screens/dashboard_screen.dart';
import 'package:freemo_test/models/country.dart';

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

       case DashboardScreen.routeName:
      return PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: DashboardScreen(),
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

        case SearchCountriesSreen.routeName:
      return PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: SearchCountriesSreen(
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
