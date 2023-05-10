import 'dart:developer';
import 'dart:io';

import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:app_doc_1/src/features/core/models/ubdate_data_model/ubdate_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UbdateDataRepository extends GetxController {
  static UbdateDataRepository get instance => Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _db = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();
  dynamic _pickerImageError;
  RxList imagesFileList = [].obs;
  RxString imagePath = ''.obs;
  List imagesUrlList = [];
  final RxString mainCategValue = 'выберите категорию'.obs;

  void onGhanged(String newValue) {
    mainCategValue.value = newValue;
  }
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

  void uploadProduct(data) async {
    // ignore: unrelated_type_equality_checks
    if (mainCategValue != 'выберите категорию') {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();

        if (imagesFileList.isNotEmpty) {
          try {
            for (var image in imagesFileList) {
              firebase_storage.Reference reference = firebase_storage
                  .FirebaseStorage.instance
                  .ref('products/$mainCategValue/${basename(image.path)}');
              log(mainCategValue.toString());
              log(image.toString());
              await reference.putFile(File(image.path)).whenComplete(() async {
                await reference.getDownloadURL().then((value) {
                  imagesUrlList.add(value);
                });
              });
            }
          } catch (e) {
            log('$e');
          }
          // log('images picked');
          // log('$price');
          // log('$quantity');
          // log('$productName');
          // log('$productDescription');

          //imagesFileList = [].obs;

          formKey.currentState!.reset();
        } else {
          Get.showSnackbar(const GetSnackBar(message: 'Please pick images'));
        }
      } else {
        Get.showSnackbar(const GetSnackBar(message: 'Please fill all fields'));
      }
    } else {
      Get.showSnackbar(const GetSnackBar(message: 'Please select category'));
    }
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
