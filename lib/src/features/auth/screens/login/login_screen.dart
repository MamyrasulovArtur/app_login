import 'package:app_doc_1/src/common_widgets/form/form_heared_widget.dart';
import 'package:app_doc_1/src/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';
import 'widgets/login_footer_widget.dart';
import 'widgets/login_form_widget.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHearedWidget(
                  size: size,
                  image: tWelcomeScreenImage,
                  title: tLoginTitle,
                  subTitle: tLoginSubTitle,
                ),
                const LoginForm(),
                const LoginFooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
