
// import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freemo_test/constants/color.dart';
import 'package:freemo_test/constants/utils.dart';
import 'package:freemo_test/features/auth/screens/register_screen.dart';
import 'package:freemo_test/features/dashboard/screens/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late String? token;
  late String? isVerify;
  late String? email;
  late String? id;
  late int? isChoosePlan;
  late String? reservations;

  late bool? darkMode;
  // late int? globalLanguage;

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  void getUserData() async {
    // Retrieve from phone memory

   
    setState(() {

 Future.delayed(const Duration(milliseconds: 1000), () {
          Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Future.delayed(const Duration(milliseconds: 1000), () {
    //     Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
    //   });
    // });

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        alignment: Alignment.center,
        child: SvgPicture.asset(
        "${assetImg}logo.svg",
        height: 80,
        width: 80,
      ),
        
       
      ),
    );
  }
}
