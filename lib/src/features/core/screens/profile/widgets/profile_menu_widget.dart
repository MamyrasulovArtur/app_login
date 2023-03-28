import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../constants/colors.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.textTheme,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final TextTheme textTheme;
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: tAccentColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(100)),
          child: Icon(icon)),
      title: Text(title, style: textTheme.bodyLarge?.apply(color: textColor)),
      trailing: endIcon
          ? Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: tAccentColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(100)),
              child:
                  const Icon(LineAwesomeIcons.angle_right, color: tAccentColor))
          : null,
    );
  }
}
