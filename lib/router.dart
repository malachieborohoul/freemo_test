
import 'package:flutter/material.dart';
import 'package:freemo_test/features/auth/screens/login_screen.dart';
import 'package:freemo_test/features/auth/screens/register_screen.dart';
import 'package:freemo_test/features/auth/screens/search_countries_sreen.dart';
import 'package:freemo_test/features/dashboard/screens/dashboard_screen.dart';

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
          child: const LoginScreen(),
        );
      });

       case DashboardScreen.routeName:
      return PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const DashboardScreen(),
        );
      });


 

        case SearchCountriesSreen.routeName:
      return PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const SearchCountriesSreen(
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
