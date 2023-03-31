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
  var verificationId = ''.obs;
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

  Future<void> phoneAuthentication(String phoneNo) async {
    log(phoneNo);
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('Error', 'The provided phone number is not valid');
          } else {
            Get.snackbar('Error', 'Something went wrong. Try again');
          }
        },
        codeSent: (verificationId, resendToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        });
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  Future<String?>  createUserWithEmailAndPassword(
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

  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
