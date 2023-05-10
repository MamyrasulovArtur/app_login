import 'package:app_doc_1/src/features/core/models/ubdate_data_model/ubdate_data_model.dart';
import 'package:app_doc_1/src/repository/auth_repository/auth_repository.dart';
import 'package:app_doc_1/src/repository/ubdate_data_repository/ubdate_data_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UbdateController extends GetxController {
  static UbdateController get instance => Get.find();

  final condition = TextEditingController();
  final amount = TextEditingController();
  final name = TextEditingController();
  final price = TextEditingController();

  final userRepo = Get.put(UbdateDataRepository());
  // final controller = Get.put(OTPController());

  // void registrerUser(String email, String password) {
  //   String? error = AuthRepository.instance
  //       .createUserWithEmailAndPassword(email, password) as String?;
  //   if (error != null) {
  //     Get.showSnackbar(GetSnackBar(
  //       message: error.toString(),
  //     ));
  //   }
  // }
  Future<void> pickerImageGallery() async {
    userRepo.pickImageFromGallery();
  }

  Future<void> createUserS(UbdateDataModel data) async {
    await userRepo.createUser(data);
    // phoneAuthentication(user.phoneNo);
    // Get.to(() => const OTPScreen());
  }

  void phoneAuthentication(String phoneNo) {
    AuthRepository.instance.phoneAuthentication(phoneNo);
  }
}
