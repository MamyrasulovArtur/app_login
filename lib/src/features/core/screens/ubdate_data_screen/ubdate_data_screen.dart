import 'dart:io';

import 'package:app_doc_1/src/constants/sizes.dart';
import 'package:app_doc_1/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/colors.dart';
import '../../../../repository/ubdate_data_repository/ubdate_data_repository.dart';
import '../../controllers/ubdate_controller.dart';
import '../../models/ubdate_data_model/ubdate_data_model.dart';

class UbdareDataScreen extends StatelessWidget {
  const UbdareDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UbdateController());
    final controllerData = Get.put(UbdateDataRepository());

    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    var isDart = MediaQuery.of(context).platformBrightness == Brightness.dark;

    var inputDecoration = InputDecoration(
      labelText: 'price',
      hintText: 'price .. \$',
      labelStyle: const TextStyle(color: Colors.purple),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.yellow,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blueAccent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10)),
    );

    Widget previewImages() {
      if (controllerData.imagesFileList.isNotEmpty) {
        return ListView.builder(
            itemCount: controllerData.imagesFileList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:const  EdgeInsets.all(5),
                child: Image.file(
                  fit: BoxFit.cover,
                  File(controllerData.imagesFileList[index].path),
                ),
              );
            });
      } else {
        return const Text(
          'You have not \n \n picked images yet !',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        );
      }
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(LineAwesomeIcons.angle_left),
              color: isDart ? Colors.white : Colors.black),
          title: Text(tEditProfile, style: textTheme.headlineSmall),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Form(
                child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Obx(
                        () => ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            alignment: Alignment.center,
                            height: size.height * 0.25,
                            width: size.width * 0.5,
                            color: Colors.blueGrey.shade100,
                            child: previewImages(),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          child: Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                  color: tPrimaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(LineAwesomeIcons.image_file,
                                  color: Colors.black)),
                          onTap: () {
                            controller.pickerImageGallery();
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  SizedBox(
                    width: size.width * 0.45,
                    child: TextFormField(
                      controller: controller.name,
                      decoration: inputDecoration.copyWith(
                        labelText: 'price',
                        hintText: 'price .. \$',
                      ),
                    ),
                  ),
                  const SizedBox(height: tFormHeight - 20),
                  SizedBox(
                    width: size.width * 0.45,
                    child: TextFormField(
                      controller: controller.condition,
                      decoration: inputDecoration.copyWith(
                        labelText: 'Quantity',
                        hintText: 'Add Quantity',
                      ),
                    ),
                  ),
                  const SizedBox(height: tFormHeight - 20),
                  SizedBox(
                    width: size.width,
                    child: TextFormField(
                        maxLength: 100,
                        maxLines: 2,
                        controller: controller.price,
                        decoration: inputDecoration.copyWith(
                          labelText: 'product description',
                          hintText: ' Enter product description ',
                        )),
                  ),
                  const SizedBox(height: tFormHeight - 20),
                  SizedBox(
                    width: size.width,
                    child: TextFormField(
                        controller: controller.amount,
                        maxLength: 500,
                        maxLines: 4,
                        decoration: inputDecoration.copyWith(
                          labelText: 'product name',
                          hintText: 'Enter product name',
                        )),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: tPrimaryColor,
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () async {
                            final data = UbdateDataModel(
                              name: controller.name.text.trim(),
                              condition: controller.condition.text.trim(),
                              price: controller.price.text.trim(),
                              amount: controller.amount.text.trim(),
                            );
                            await UbdateController.instance.createUserS(data);
                          },
                          child: const Text(
                            tEditProfile,
                            style: TextStyle(color: Colors.black),
                          ))),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text.rich(TextSpan(
                        text: tJoined,
                        style: TextStyle(fontSize: 12),
                        children: [
                          TextSpan(
                              text: tJoinedAt,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12))
                        ],
                      )),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent.withOpacity(0.1),
                            elevation: 0.0,
                            foregroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            side: BorderSide.none),
                        child: const Text(tDelete),
                      )
                    ],
                  )
                ],
              ),
            ])),
          ),
        ));
  }
}
