import 'package:flutter/material.dart';
import 'package:freemo_test/common/widgets/custom_regular_title.dart';
import 'package:freemo_test/constants/color.dart';
import 'package:freemo_test/constants/padding.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key, required this.backgroundColor,  this.textColor=AppColors.background, required this.title});
  final Color backgroundColor;
  final Color textColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width*.4,
      alignment: Alignment.center,
      decoration:  BoxDecoration(
      color: backgroundColor,

        borderRadius: const BorderRadius.all(Radius.circular(AppPadding.miniSpacer)),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: size.width*0.08,horizontal: size.width*0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.add, color: AppColors.background, size: AppPadding.miniSpacer+5,),
            const SizedBox(height: AppPadding.miniSpacer,),
            CustomRegularTitle(
              size: AppPadding.miniSpacer+4,
              title: title,
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
