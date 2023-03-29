import 'dart:developer';

import 'package:app_doc_1/src/constants/text_strings.dart';
import 'package:app_doc_1/src/features/auth/controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var otp;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tOtpTitle,
              style: GoogleFonts.montserrat(
                  fontSize: 60, fontWeight: FontWeight.bold),
            ),
            Text(tOtpSubTitle,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center),
            const SizedBox(height: 40),
            const Text(
              '$tOtpMessege support@codinnggwitht.com',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              onSubmit: (code) {
                otp = code;
                OTPController.instance.verifyOTP(otp);
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  log("OTP is=>$otp");
                  OTPController.instance.verifyOTP(otp);
                },
                child: const Text(tNext),
              ),
            )
          ],
        ),
      ),
    );
  }
}
