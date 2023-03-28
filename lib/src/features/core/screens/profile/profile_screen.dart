import 'package:app_doc_1/src/constants/colors.dart';
import 'package:app_doc_1/src/constants/image_strings.dart';
import 'package:app_doc_1/src/constants/sizes.dart';
import 'package:app_doc_1/src/constants/text_strings.dart';
import 'package:app_doc_1/src/features/core/screens/profile/ubdate_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'widgets/profile_menu_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    var isDart = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(LineAwesomeIcons.angle_left),
            color: isDart ? Colors.white : Colors.black,
          ),
          centerTitle: true,
          title: Text(tProfile, style: textTheme.headlineSmall),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                isDart ? LineAwesomeIcons.sun : LineAwesomeIcons.moon,
              ),
              color: isDart ? Colors.white : Colors.black,
            ),
          ]),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              Stack(
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
              ),
              const SizedBox(height: 10),
              Text(tProfileHeading, style: textTheme.headlineSmall),
              Text(tProfileSubHeading, style: textTheme.bodyMedium),
              const SizedBox(height: 20),
              SizedBox(
                  width: 225,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: tPrimaryColor,
                          side: BorderSide.none,
                          shape: const StadiumBorder()),
                      onPressed: () {
                        Get.to(() => const UbdateProfileScreen());
                      },
                      child: const Text(tEditProfile,
                          style: TextStyle(color: tDarkColor)))),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  textTheme: textTheme,
                  icon: LineAwesomeIcons.cog,
                  onPress: () {},
                  title: tMenu1),
              ProfileMenuWidget(
                  textTheme: textTheme,
                  icon: LineAwesomeIcons.wallet,
                  onPress: () {},
                  title: tMenu2),
              ProfileMenuWidget(
                  textTheme: textTheme,
                  icon: LineAwesomeIcons.user_check,
                  onPress: () {},
                  title: tMenu3),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  textTheme: textTheme,
                  icon: LineAwesomeIcons.info,
                  onPress: () {},
                  title: tMenu4),
              ProfileMenuWidget(
                  textTheme: textTheme,
                  icon: LineAwesomeIcons.alternate_sign_out,
                  onPress: () {},
                  textColor: Colors.red,
                  endIcon: false,
                  title: "Logout"),
            ],
          ),
        ),
      ),
    );
  }
}
