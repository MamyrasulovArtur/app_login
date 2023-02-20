import 'package:app_doc_1/src/constants/colors.dart';
import 'package:app_doc_1/src/features/auth/controllers/on_broading_screen_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBroadingScreen extends StatelessWidget {
  OnBroadingScreen({super.key});

  final obcontroller = OnBroadingScreenController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: obcontroller.pages,
            liquidController: obcontroller.controller,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
            onPageChangeCallback: obcontroller.onPageChangeCallback,
          ),
          Positioned(
            bottom: 50,
            child: OutlinedButton(
              onPressed: () => obcontroller.animatedToNextSlide(),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.black26),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: tDarkColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => obcontroller.skip(),
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Obx(
            () => Positioned(
              bottom: 18,
              child: AnimatedSmoothIndicator(
                activeIndex: obcontroller.currentPage.value,
                count: 3,
                effect: const WormEffect(
                  activeDotColor: Colors.deepPurpleAccent,
                  //dotHeight: 5.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
