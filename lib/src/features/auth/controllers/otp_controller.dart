import 'package:app_doc_1/src/features/core/screens/dashboard/dashboard.dart';
import 'package:app_doc_1/src/repository/auth_repository/auth_repository.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();
  void verifyOTP(String otp) async {
    var isVerified = await AuthRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const DashBoard()) : Get.back();
  }
}
