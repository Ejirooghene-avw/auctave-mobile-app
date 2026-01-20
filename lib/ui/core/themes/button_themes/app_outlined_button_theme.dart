import 'package:auctave_mobile_app/gen/colors.gen.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class AppOutlinedButtonTheme {
  static OutlinedButtonThemeData mainTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      minimumSize: Size(double.infinity, 48.0),
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
      foregroundColor: ColorName.pbaBlack,
      textStyle: AppTextStyle.kPBA16pxMedium,
    ),
  );
}
