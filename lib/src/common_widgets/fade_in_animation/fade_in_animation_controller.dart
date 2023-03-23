import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

import '../../features/auth/screens/welcome/welcome_screen.dart';

class TFadeInAnimationController extends GetxController {
  static TFadeInAnimationController get find => Get.find();
  RxBool animate = false.obs;

  Future startSplashAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));

    animate.value = true;

    await Future.delayed(const Duration(milliseconds: 3000));
    animate.value = false;
    await Future.delayed(const Duration(milliseconds: 2000));

    Get.offAll(() => const WelcomeScreen());
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
  }
}
