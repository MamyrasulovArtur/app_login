import 'package:app_doc_1/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:app_doc_1/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:app_doc_1/src/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: TTextTheme.lightTextTheme,
      outlinedButtonTheme: TOutlinedButton.lightOutlinedButtonTheme,
      elevatedButtonTheme: TElevatedButton.lightElevatedButtonTheme
      //   primarySwatch: Colors.deepPurple,
      );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    outlinedButtonTheme: TOutlinedButton.darkOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButton.darkElevatedButtonTheme,
  );
}
