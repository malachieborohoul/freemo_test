
import 'package:flutter/material.dart';
import 'package:freemo_test/constants/color.dart';
import 'package:freemo_test/constants/global.dart';

class CustomRegularTitle extends StatelessWidget {
  const CustomRegularTitle(
      {super.key,
      required this.title,
      this.color = AppColors.primary,
      this.size = 20,
      this.family = playfair});
  final String title;
  final Color color;
  final double size;
  final String family;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        height: 1,
        fontFamily: family,
        fontSize: size,
        color: color,
      ),
    );
  }
}
