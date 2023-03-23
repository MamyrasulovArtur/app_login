import 'dart:developer';

import 'package:app_doc_1/src/common_widgets/fade_in_animation/fade_in_animation_madel.dart';
import 'package:app_doc_1/src/constants/colors.dart';
import 'package:app_doc_1/src/constants/sizes.dart';
import 'package:app_doc_1/src/constants/text_strings.dart';
import 'package:app_doc_1/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/fade_in_animation/animation_design.dart';
import '../../../../constants/image_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log("SplashScreen");
    // var animateValue = splashController.animate.value;
    final controller = Get.put(TFadeInAnimationController());
    controller.startSplashAnimation();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            TFadeInAnimation(
              durationInMs: 1600,
              animatePosition: TAnimatePosition(
                topAfter: 0,
                topBefore: -30,
                leftAfter: 0,
                leftBefore: -30,
              ),
              child: const SizedBox(
                height: 100,
                width: 100,
                child: Image(
                  image: AssetImage(tSplashTopIcon),
                ),
              ),
            ),
            TFadeInAnimation(
              durationInMs: 2400,
              animatePosition:
                  TAnimatePosition(bottomAfter: 100, bottomBefore: 0),
              child: Image(
                fit: BoxFit.cover,
                height: size.height * 0.5,
                image: const AssetImage(tSplashImage),
              ),
            ),
            TFadeInAnimation(
              durationInMs: 2000,
              animatePosition: TAnimatePosition(
                topAfter: 80,
                topBefore: 80,
                leftAfter: tDefaultSize,
                leftBefore: -80,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tAppName,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Text(
                    tAppTagLine,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
            TFadeInAnimation(
              durationInMs: 2400,
              animatePosition: TAnimatePosition(
                bottomAfter: 60,
                bottomBefore: 0,
                rightBefore: tDefaultSize,
                rightAfter: tDefaultSize,
              ),
              child: Container(
                height: tSplashContainerSize,
                width: tSplashContainerSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: tPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
