import 'package:auctave_mobile_app/gen/colors.gen.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class AppElevatedButtonTheme {
  static final ElevatedButtonThemeData mainTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, 48.0),
      padding: EdgeInsets.symmetric(vertical: 18.0),
      textStyle: AppTextStyle.kPBA16pxMedium,
      foregroundColor: ColorName.pbaWhite,
      backgroundColor: ColorName.pbaBlack,
    ),
  );
}
