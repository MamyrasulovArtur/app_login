import 'package:flutter/material.dart';

import 'package:app_doc_1/src/features/auth/models/user_model.dart';
import 'package:app_doc_1/src/features/auth/controllers/signup_controller.dart';
import 'package:app_doc_1/src/features/auth/screens/forget_password/forget_password-otp/otp_screen.dart';

import 'package:get/get.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    // ignore: no_leading_underscores_for_local_identifiers
    final _formKey = GlobalKey<FormState>();
    // ignore: avoid_unnecessary_containers
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: tFormHeight - 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
                controller: controller.fullName,
                decoration: const InputDecoration(
                    label: Text(tFullName),
                    prefixIcon: Icon(Icons.person_outline_outlined))),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
                controller: controller.email,
                decoration: const InputDecoration(
                    label: Text(tEmail),
                    prefixIcon: Icon(Icons.email_outlined))),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
                controller: controller.phoneNo,
                decoration: const InputDecoration(
                    label: Text(tPhoneNo),
                    prefixIcon: Icon(Icons.numbers_outlined))),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
                controller: controller.password,
                decoration: const InputDecoration(
                    label: Text(tPassword),
                    prefixIcon: Icon(Icons.fingerprint))),
            const SizedBox(height: tFormHeight - 10),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // SignUpController.instance.registrerUser(
                      //     controller.email.text.trim(),
                      //     controller.password.text.trim());

                      // SignUpController.instance
                      //     .phoneAuthentication(controller.phoneNo.text.trim());
                      // Get.to(() => OTPScreen());

                      final user = UserModel(
                        fullName: controller.fullName.text.trim(),
                        email: controller.email.text.trim(),
                        phoneNo: controller.phoneNo.text.trim(),
                        password: controller.password.text.trim(),
                      );
                      SignUpController.instance
                          .phoneAuthentication(user.phoneNo);
                      Get.to(() => OTPScreen());
                    }
                  },
                  child: Text(tSignup.toUpperCase()),
                )),
            const SizedBox(height: tFormHeight - 20),
          ],
        ),
      ),
    );
  }
}
