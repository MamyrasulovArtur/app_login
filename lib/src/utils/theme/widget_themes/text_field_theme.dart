import 'package:app_doc_1/src/constants/colors.dart';
import 'package:flutter/material.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
    prefixIconColor: tSecondaryColor,
    floatingLabelStyle: const TextStyle(color: tSecondaryColor),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: tSecondaryColor, width: 2.0),
    ),
  );
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
    prefixIconColor: tPrimaryColor,
    floatingLabelStyle: const TextStyle(color: tPrimaryColor),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: tPrimaryColor, width: 2.0),
    ),
  );
}
