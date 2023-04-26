import 'dart:developer';

import 'package:app_doc_1/src/features/core/models/ubdate_data_model/ubdate_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UbdateDataRepository extends GetxController {
  static UbdateDataRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();
  dynamic _pickerImageError;
  RxList imagesFileList = [].obs;
  RxString imagePath = ''.obs;
  // Future pickImageFromCamera() async {
  //   final ImagePicker _picker = ImagePicker();
  //   try {
  //     final _pickerImage = await _picker.pickImage(
  //         imageQuality: 95,
  //         maxHeight: 300,
  //         maxWidth: 300,
  //         source: ImageSource.camera);
  //     // imageFile = _pickerImage;
  //     if (_pickerImage != null) {
  //       imagePath.value = _pickerImage.path.toString();
  //     }
  //     log(_pickerImage!.path);
  //   } catch (e) {
  //     _pickerImageError = e;
  //   }
  //   log(_pickerImageError);
  // }

  void pickImageFromGallery() async {
    try {
      final _pickerImage = await _picker.pickMultiImage(
        imageQuality: 95,
        maxHeight: 300,
        maxWidth: 300,
      );

      if (_pickerImage != null) {
        //imagePath.value = _pickerImage as String;
        imagesFileList.addAll(_pickerImage);
      }
      log(imagePath as String);
    } catch (e) {
      _pickerImageError = e;
    }
    log(_pickerImageError);
  }

  createUser(UbdateDataModel data) async {
    await _db
        .collection("Datas")
        .add(data.toJson())
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

  // Future<UserModel> getUserDetails(String email) async {
  //   final snapshot =
  //       await _db.collection("Users").where("Email", isEqualTo: email).get();
  //   final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
  //   log(userData.email);
  //   log(userData.password);
  //   log(userData.id!);
  //   return userData;
  // }

  Future<List<UbdateDataModel>> allUser() async {
    final snapshot = await _db.collection("Datas").get();
    final userData =
        snapshot.docs.map((e) => UbdateDataModel.fromSnapshot(e)).toList();
    log(userData[0].name);
    log(userData[0].amount);
    log(userData[0].id!);
    return userData;
  }
}
