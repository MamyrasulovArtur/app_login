import 'dart:developer';

import 'package:app_doc_1/src/features/auth/screens/welcome/welcome_screen.dart';
import 'package:app_doc_1/src/features/core/screens/dashboard/dashboard.dart';
import 'package:app_doc_1/src/repository/auth_repository/excemtions/signun_email_password_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  //Varibales
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser); // OR  as Rx<User?>;
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const DashBoard());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const DashBoard())
          : Get.offAll(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      log(ex.message.toString());
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      log(ex.message.toString());
      throw ex;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
