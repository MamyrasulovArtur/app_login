import 'package:app_doc_1/src/features/auth/controllers/otp_controller.dart';
import 'package:app_doc_1/src/features/auth/models/user_model.dart';
import 'package:app_doc_1/src/repository/auth_repository/auth_repository.dart';
import 'package:app_doc_1/src/repository/user_repository/user_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../screens/forget_password/forget_password-otp/otp_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());
  final controller = Get.put(OTPController());
  void registrerUser(String email, String password) {
    String? error = AuthRepository.instance
        .createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    phoneAuthentication(user.phoneNo);
    Get.to(() => const OTPScreen());
  }

  void phoneAuthentication(String phoneNo) {
    AuthRepository.instance.phoneAuthentication(phoneNo);
  }
}
