import 'package:auctave_mobile_app/routing/app_routes.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_strings/login_strings.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class ForgotPasswordClickable extends StatelessWidget {
  const ForgotPasswordClickable({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.resetPassword);
        },
        child: Text(
          LoginStrings.forgotPassword,
          style: AppTextStyle.kPBA16pxMedium.copyWith(color: Color(0xFFB2DA36)),
        ),
      ),
    );
  }
}
