import 'dart:developer';

import 'package:app_doc_1/src/features/auth/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  createUser(UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(() => Get.snackbar(
            'Success', "You account has been  created.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green))
        // ignore: body_might_complete_normally_catch_error
        .catchError((error, stackTrace) {
      Get.snackbar('Error', "Something went wrong.Try again.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      log("ERROR $error");
    });
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    log(userData.email);
    log(userData.password);
    log(userData.id!);
    return userData;
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("Users").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    log(userData[0].email);
    log(userData[0].password);
    log(userData[0].id!);
    return userData;
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
