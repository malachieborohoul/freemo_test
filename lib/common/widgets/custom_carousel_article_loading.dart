

import 'package:flutter/material.dart';
import 'package:freemo_test/constants/color.dart';
import 'package:freemo_test/constants/padding.dart';

class CustomCarouselArticleLoading extends StatefulWidget {
   CustomCarouselArticleLoading({
    super.key,  
  });

  @override
  State<CustomCarouselArticleLoading> createState() =>
      _CustomCarouselArticleLoadingState();
}

class _CustomCarouselArticleLoadingState extends State<CustomCarouselArticleLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    );

    animation = Tween<double>(begin: 0.3, end: 0.4).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutCirc));

    controller.repeat();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          child: Container(
            width: double.infinity,
            height: 60,
            child: AnimatedBuilder(
                animation: controller,
                builder: (context, snapshot) {
                  return Container(
                    height: 120,
                    width: 85,
                    color: AppColors.defaultBorder .withOpacity(animation.value),
                  );
                }),
          ),
        ),
      
   
        const SizedBox(
          height: AppPadding.miniSpacer
,
        ),
            ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          child: Container(
            width: double.infinity,
            height: 60,
            child: AnimatedBuilder(
                animation: controller,
                builder: (context, snapshot) {
                  return Container(
                    height: 120,
                    width: 85,
                    color: AppColors.defaultBorder .withOpacity(animation.value),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
