import 'package:app_doc_1/src/common_widgets/form/form_heared_widget.dart';
import 'package:app_doc_1/src/constants/image_strings.dart';
import 'package:app_doc_1/src/constants/sizes.dart';
import 'package:app_doc_1/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

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
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: tFormHeight - 10),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: tFormHeight - 20),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(tFullName),
                            prefixIcon: Icon(Icons.person_outline_outlined),
                          ),
                        ),
                        const SizedBox(height: tFormHeight - 20),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(tEmail),
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                        ),
                        const SizedBox(height: tFormHeight - 20),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(tFullName),
                            prefixIcon: Icon(Icons.numbers_outlined),
                          ),
                        ),
                        const SizedBox(height: tFormHeight - 20),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text(tPassword),
                            prefixIcon: Icon(Icons.fingerprint),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
