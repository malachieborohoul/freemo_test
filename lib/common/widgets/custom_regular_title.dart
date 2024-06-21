import 'package:flutter/material.dart';
import 'package:freemo_test/constants/color.dart';
import 'package:freemo_test/constants/global.dart';

class CustomRegularTitle extends StatelessWidget {
  const CustomRegularTitle(
      {super.key,
      required this.title,
      this.color = AppColors.onBackground,
      this.size = 20,
      this.family = poppins,
      this.weight=FontWeight.bold
      });
  final String title;
  final Color color;
  final double size;
  final String family;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    int maxLength = 25;
    return Text(
      title.length>maxLength? "${title.substring(0,maxLength)}...": title,
      style: TextStyle(
          height: 1,
          fontFamily: family,
          fontSize: size,
          color: color,
          fontWeight: weight),
          
    );
  }
}
