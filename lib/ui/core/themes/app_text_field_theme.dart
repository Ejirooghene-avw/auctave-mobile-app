import 'package:auctave_mobile_app/ui/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

OutlineInputBorder _mainInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8.0),
  gapPadding: 10.0,
  borderSide: BorderSide(width: 1.0, color: Color(0xFFE5E5E5)),
);

OutlineInputBorder _focusedInputBorder = _mainInputBorder.copyWith(
  borderSide: BorderSide(color: Color(0xFF1E1E1E)),
);

class AppTextFieldTheme {
  static InputDecorationThemeData mainInputDecorationTheme =
      InputDecorationThemeData(
        hintStyle: AppTextStyle.kPBA16pxRegular.copyWith(
          color: Color(0xFFA5A5A5),
        ),
        border: _mainInputBorder,
        focusedBorder: _focusedInputBorder,
        enabledBorder: _mainInputBorder,
      );
}
