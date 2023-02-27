import 'package:app_doc_1/src/common_widgets/form/form_heared_widget.dart';
import 'package:app_doc_1/src/constants/image_strings.dart';
import 'package:app_doc_1/src/constants/sizes.dart';
import 'package:app_doc_1/src/constants/text_strings.dart';
import 'package:app_doc_1/src/features/auth/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                FormHearedWidget(
                  size: size,
                  image: tWelcomeScreenImage,
                  title: tSignUpTitle,
                  subTitle: tSignUpSubTitle,
                ),
                const SignUpFormWidget(),
                Column(
                  children: [
                    const Text("OR"),
                    const SizedBox(height: tFormHeight - 20),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Image(
                          image: AssetImage(tGoogleLogoImage),
                          width: 20.0,
                        ),
                        label: const Text(tSignInWithGoogle),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const LoginScreen());
                      },
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(
                            text: tAlreadyHaveAnAccount,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          TextSpan(text: tLogin.toUpperCase()),
                        ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
