import 'package:flutter/material.dart';
import 'package:freemo_test/constants/color.dart';
import 'package:freemo_test/constants/global.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.text = "",
      this.isLoading = false,
      this.width = 1,
      this.height = 55,
      this.color = AppColors.primary,
      this.textColor = AppColors.background,
      this.fontSize = 20,
      this.isTap = true,
      this.weight=FontWeight.bold
      
      });
  final String text;
  final bool isLoading;
  final double width;
  final double height;
  final Color color;
  final Color textColor;
  final double fontSize;
  final bool isTap;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width * size.width,
      decoration: BoxDecoration(
          color: isTap ? color : color.withOpacity(0.7),
          borderRadius: BorderRadius.all(
            Radius.circular(height),
          ),
          border: Border.all(color: AppColors.primary)),
      child: isLoading
          ? const CircularProgressIndicator(
              color: AppColors.background,
            )
          : Text(
              text,
              style: TextStyle(
                  fontSize: fontSize,
                  fontFamily: poppins,
                  color: textColor,
                  fontWeight: weight),
            ),
    );
  }
}
