import 'package:app_doc_1/src/repository/auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';

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
      leading: const Icon(Icons.menu, color: Colors.black),
      title: Text(tAppName, style: textTheme.headlineMedium),
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
              AuthRepository.instance.logout();
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
