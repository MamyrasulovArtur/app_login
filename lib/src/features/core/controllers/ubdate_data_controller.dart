import 'package:get/get.dart';

import '../../../repository/auth_repository/auth_repository.dart';
import '../../../repository/user_repository/user_repository.dart';
import '../../auth/models/user_model.dart';

class UbdateDataController extends GetxController {
  static UbdateDataController get instanse => Get.find();
  // final _authRepo = Get.put(AuthRepository());
  final userRepo = Get.put(UserRepository());
  // Future<UserModel?> getUserData() async {
  //   final email = _authRepo.firebaseUser.value?.email;
  //   if (email != null) {
  //     return await userRepo.getUserDetails(email);
  //   } else {
  //     Get.snackbar("Error", "Login to continue");
  //     return null;
  //   }
  // }

  Future<List<UserModel>> getAllData() async {
    return await userRepo.allUser();
  }
}
