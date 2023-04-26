import 'package:app_doc_1/src/features/auth/models/user_model.dart';
import 'package:app_doc_1/src/repository/auth_repository/auth_repository.dart';
import 'package:app_doc_1/src/repository/user_repository/user_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instanse => Get.find();
  final _authRepo = Get.put(AuthRepository());
  final userRepo = Get.put(UserRepository());
  Future<UserModel?> getUserData() async {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return await userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
      return null;
    }
  }

  Future<List<UserModel>> getAllData() async {
    return await userRepo.allUser();
  }
}
