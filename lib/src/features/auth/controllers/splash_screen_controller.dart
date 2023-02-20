import 'package:app_doc_1/src/features/auth/screens/on_broading/on_broading_screen.dart';

import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

import '../screens/welcome/welcome_screen.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();
  RxBool animate = false.obs;
  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 5000));

    animate.value = true;

    await Future.delayed(const Duration(milliseconds: 5000));

    Get.to(() => const WelcomeScreen());
  }
}
