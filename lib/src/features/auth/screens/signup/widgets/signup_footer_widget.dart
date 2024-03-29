import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../controllers/signup_controller.dart';
import '../../login/login_screen.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Column(
      children: [
        const Text("OR"),
        const SizedBox(height: tFormHeight - 20),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              onPressed: () {
                controller.googleAuth();
              },
              icon: const Image(                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
                image: AssetImage(tGoogleLogoImage),
                width: 20.0,
              ),
              label: const Text(tSignInWithGoogle)),
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
    );
  }
}
