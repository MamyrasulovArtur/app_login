import 'dart:developer';

import 'package:app_doc_1/src/features/auth/models/user.dart';
import 'package:app_doc_1/src/features/core/screens/dashboard/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  static AuthService get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  UserS? _userFromFireBaseUser(User user) {
    // ignore: unnecessary_null_comparison
    return user != null ? UserS(uid: user.uid) : null;
  }

  Stream<UserS> get user {
    return _auth
        .authStateChanges()
        .map(_userFromFireBaseUser as UserS Function(User? event));
  }


  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
