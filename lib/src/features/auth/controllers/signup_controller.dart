import 'package:app_doc_1/src/repository/auth_repository/auth_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  void registrerUser(String email, String password) {
    AuthRepository.instance.createUserWithEmailAndPassword(email, password);
  }
}
