import 'dart:developer';

import 'package:app_doc_1/src/constants/sizes.dart';
import 'package:app_doc_1/src/constants/text_strings.dart';
import 'package:app_doc_1/src/features/auth/models/user_model.dart';
import 'package:app_doc_1/src/features/core/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UbdateProfileScreen extends StatelessWidget {
  const UbdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

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
          child: FutureBuilder<List<UserModel>>(
            future: controller.getAllData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data as UserModel;
                  // return Column(children: [
                  //   Stack(
                  //     children: [
                  //       SizedBox(
                  //           height: 120,
                  //           width: 120,
                  //           child: ClipRRect(
                  //               borderRadius: BorderRadius.circular(100),
                  //               child: Image.asset(tProfileImage,
                  //                   fit: BoxFit.cover))),
                  //       Positioned(
                  //         bottom: 0,
                  //         right: 0,
                  //         child: Container(
                  //             height: 35,
                  //             width: 35,
                  //             decoration: BoxDecoration(
                  //                 color: tPrimaryColor,
                  //                 borderRadius: BorderRadius.circular(100)),
                  //             child: const Icon(LineAwesomeIcons.camera,
                  //                 color: Colors.black)),
                  //       )
                  //     ],
                  //   ),
                  //   Form(
                  //       child: Column(
                  //     children: [
                  //       const SizedBox(height: 50),
                  //       TextFormField(
                  //           // controller: controller.fullName,
                  //           initialValue: userData.fullName,
                  //           decoration: const InputDecoration(
                  //               label: Text(tFullName),
                  //               prefixIcon:
                  //                   Icon(Icons.person_outline_outlined))),
                  //       const SizedBox(height: tFormHeight - 20),
                  //       TextFormField(
                  //           //  controller: controller.email,
                  //           initialValue: userData.email,
                  //           decoration: const InputDecoration(
                  //               label: Text(tEmail),
                  //               prefixIcon: Icon(Icons.email_outlined))),
                  //       const SizedBox(height: tFormHeight - 20),
                  //       TextFormField(
                  //           //  controller: controller.phoneNo,
                  //           initialValue: userData.phoneNo,
                  //           decoration: const InputDecoration(
                  //               label: Text(tPhoneNo),
                  //               prefixIcon: Icon(Icons.numbers_outlined))),
                  //       const SizedBox(height: tFormHeight - 20),
                  //       TextFormField(
                  //           //     controller: controller.password,
                  //           initialValue: userData.password,
                  //           decoration: const InputDecoration(
                  //               label: Text(tPassword),
                  //               prefixIcon: Icon(Icons.fingerprint))),
                  //       const SizedBox(height: tFormHeight),
                  //       SizedBox(
                  //           width: double.infinity,
                  //           child: ElevatedButton(
                  //               style: ElevatedButton.styleFrom(
                  //                   backgroundColor: tPrimaryColor,
                  //                   side: BorderSide.none,
                  //                   shape: const StadiumBorder()),
                  //               onPressed: () {},
                  //               child: const Text(
                  //                 tEditProfile,
                  //                 style: TextStyle(color: Colors.black),
                  //               ))),
                  //       const SizedBox(height: tFormHeight),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           const Text.rich(TextSpan(
                  //             text: tJoined,
                  //             style: TextStyle(fontSize: 12),
                  //             children: [
                  //               TextSpan(
                  //                   text: tJoinedAt,
                  //                   style: TextStyle(
                  //                       fontWeight: FontWeight.bold,
                  //                       fontSize: 12))
                  //             ],
                  //           )),
                  //           ElevatedButton(
                  //             onPressed: () {},
                  //             style: ElevatedButton.styleFrom(
                  //                 backgroundColor:
                  //                     Colors.redAccent.withOpacity(0.1),
                  //                 elevation: 0.0,
                  //                 foregroundColor: Colors.red,
                  //                 shape: const StadiumBorder(),
                  //                 side: BorderSide.none),
                  //             child: const Text(tDelete),
                  //           )
                  //         ],
                  //       )
                  //     ],
                  //   )),
                  // ]);
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading:
                            const Icon(LineAwesomeIcons.person_entering_booth),
                        title: Text(
                          "Name:${snapshot.data![index].fullName}",
                        ),
                        subtitle: Text("Email${snapshot.data![index].email}"),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(
                    child: Text("Something went worng"),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
