import 'package:app_doc_1/src/constants/sizes.dart';
import 'package:app_doc_1/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';

class UbdateProfileScreen extends StatelessWidget {
  const UbdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    var isDart = MediaQuery.of(context).platformBrightness == Brightness.dark;
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
          child: Column(children: [Stack(
                children: [
                  SizedBox(
                      height: 120,
                      width: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child:
                              Image.asset(tProfileImage, fit: BoxFit.cover))),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: tPrimaryColor,
                            borderRadius: BorderRadius.circular(100)),
                        child: const Icon(LineAwesomeIcons.alternate_pencil,
                            color: Colors.black)),
                  )
                ],
              ),]),
        ),
      ),
    );
  }
}
