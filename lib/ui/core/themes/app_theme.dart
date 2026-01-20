import 'package:auctave_mobile_app/ui/core/themes/app_text_field_theme.dart';
import 'package:auctave_mobile_app/ui/core/themes/button_themes/button_themes.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final mainAppTheme = ThemeData(
    elevatedButtonTheme: AppElevatedButtonTheme.mainTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.mainTheme,
    inputDecorationTheme: AppTextFieldTheme.mainInputDecorationTheme,
  );
}
