import 'package:app_doc_1/src/features/auth/screens/forget_password/forget_password_email/forget_password_mail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import 'forget_password_btn_widget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tForgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              tForgetPasswordSubTitle,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 30),
            ForgetPasswordBtnWidget(
              iconBtn: Icons.mail_outline_outlined,
              title: tEmail,
              subTitle: tResetViaEMail,
              onTap: () {
                 Navigator.pop(context);
                Get.to(() => const ForgetPasswordMailScreen());
              },
            ),
            const SizedBox(height: 20),
            ForgetPasswordBtnWidget(
              iconBtn: Icons.mobile_friendly_outlined,
              title: tPhoneNo,
              subTitle: tResetViaPhone,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
