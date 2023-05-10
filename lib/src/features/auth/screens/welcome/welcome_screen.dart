import 'dart:developer';

import 'package:app_doc_1/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:app_doc_1/src/common_widgets/fade_in_animation/fade_in_animation_madel.dart';
import 'package:app_doc_1/src/constants/colors.dart';
import 'package:app_doc_1/src/constants/image_strings.dart';
import 'package:app_doc_1/src/constants/sizes.dart';
import 'package:app_doc_1/src/constants/text_strings.dart';
import 'package:app_doc_1/src/features/auth/screens/login/login_screen.dart';
import 'package:app_doc_1/src/features/auth/screens/signup/signup_screen.dart';
import 'package:app_doc_1/src/features/auth/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/fade_in_animation/fade_in_animation_controller.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TFadeInAnimationController());
    final controllerAnon = Get.put(AuthService());
    controller.startAnimation();
    final mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final size = mediaQuery.size;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
      body: Stack(
        children: [
          TFadeInAnimation(
            durationInMs: 1200,
            animatePosition: TAnimatePosition(
              bottomAfter: 0,
              bottomBefore: 100,
              leftAfter: 0,
              leftBefore: 0,
              rightAfter: 0,
              rightBefore: 0,
              topAfter: 0,
              topBefore: 0,
            ),
            child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    width: size.width * 0.9,
                    height: size.height * 0.4,
                    fit: BoxFit.cover,
                    image: const AssetImage(tWelcomeScreenImage),
                  ),
                  Column(
                    children: [
                      Text(
                        tWelcomeTitle,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        tWelcomeSubTitle,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Get.to(() => const LoginScreen()),
                          child: Text(tLogin.toUpperCase()),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => const SignUpScreen());
                          },
                          child: Text(tSignup.toUpperCase()),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: mediaQuery.size.width * 0.5,
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.person),
                      label: const Text('Anonimna'),
                      onPressed: () async {
                        final result =
                            await controllerAnon.signInAnon();
                        // ignore: unnecessary_null_comparison
                        if (result == null) {
                          log("Error signing in");
                        } else {
                          log("Signed in");
                          log(result.uid.toString());
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
