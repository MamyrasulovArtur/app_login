import 'dart:io';

import 'package:app_doc_1/src/constants/categ_list.dart';
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

    Widget previewImages() {
      if (controllerData.imagesFileList.isNotEmpty) {
        return ListView.builder(
            itemCount: controllerData.imagesFileList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Image.file(
                  fit: BoxFit.cover,
                  File(controllerData.imagesFileList[index].path),
                ),
              );
            });
      } else {
        return const Text(
          'Вы еще не выбрали изображения!',
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
            padding: const EdgeInsets.all(tDefaultSize - 10),
            child: Form(
                key: controllerData.formKey,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: Stack(
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Icon(
                                        LineAwesomeIcons.image_file,
                                        color: Colors.black)),
                                onTap: () {
                                  controller.pickerImageGallery();
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Выберите основную категорию',
                              style: textTheme.titleSmall,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Obx(
                              () => DropdownButton(
                                  icon: const Icon(Icons.arrow_drop_down_sharp),
                                  alignment: Alignment.bottomCenter,
                                  iconSize: 30.0,
                                  iconEnabledColor: Colors.red,
                                  dropdownColor: Colors.amber.shade300,
                                  value: controllerData.mainCategValue.value,
                                  items:
                                      maincateg.map<DropdownMenuItem<String>>(
                                    (String value) {
                                      return DropdownMenuItem(
                                        // ignore: sort_child_properties_last
                                        child: Text(
                                          value,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        value: value,
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (newWalue) {
                                    controllerData.onGhanged(newWalue!);
                                  }),
                            )
                          ],
                        ),
                      )
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
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            controller: controller.name,
                            decoration: const InputDecoration(
                              labelText: 'price',
                              hintText: 'price .. \$',
                            )),
                      ),
                      const SizedBox(height: tFormHeight - 20),
                      SizedBox(
                        width: size.width * 0.45,
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: controller.condition,
                            decoration: const InputDecoration(
                              labelText: 'Quantity',
                              hintText: 'Add Quantity',
                            )),
                      ),
                      const SizedBox(height: tFormHeight - 20),
                      SizedBox(
                        width: size.width,
                        child: TextFormField(
                            maxLength: 100,
                            maxLines: 2,
                            controller: controller.price,
                            decoration: const InputDecoration(
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
                            decoration: const InputDecoration(
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
                                //  final data = UbdateDataModel(images: controllerData.imagesFileList,
                                //     name: controller.name.text.trim(),
                                //     condition: controller.condition.text.trim(),
                                //     price: controller.price.text.trim(),
                                //     amount: controller.amount.text.trim(),
                                //   );
                                //   await UbdateController.instance
                                //       .createUserS(data);
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12))
                            ],
                          )),
                          ElevatedButton(
                            onPressed: () async {
                              final data = UbdateDataModel(
                                images: controllerData.imagesFileList,
                                name: controller.name.text.trim(),
                                condition: controller.condition.text.trim(),
                                price: controller.price.text.trim(),
                                amount: controller.amount.text.trim(),
                              );
                              // await UbdateController.instance
                              //     .createUserS(data);
                              controllerData.uploadProduct(data);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.redAccent.withOpacity(0.1),
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
