import 'package:app_doc_1/src/features/core/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/text_strings.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        color: isDarkMode ? Colors.white : Colors.black,
        onPressed: () async {},
      ),
      title: Text(tAppName, style: textTheme.headlineSmall),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20, top: 7.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isDarkMode ? tDarkColor : tCardBgColor),
          child: IconButton(
            onPressed: () {
              // AuthRepository.instance.logout();
              Get.to(() => const ProfileScreen());
            },
            icon: const Image(
              image: AssetImage(tUserProfileImage),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
