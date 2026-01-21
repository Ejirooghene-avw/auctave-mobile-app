import 'package:auctave_mobile_app/gen/colors.gen.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_strings/login_strings.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class DontHaveAnAccountClickable extends StatelessWidget {
  const DontHaveAnAccountClickable({super.key});

  @override
  Widget build(BuildContext context) {
    TextSpan seperator = TextSpan(text: " ");

    TextStyle mainTextStyle = AppTextStyle.kPBA14pxRegular.copyWith(
      color: ColorName.pbaTextSecondary,
    );

    TextStyle clickableTextStyle = AppTextStyle.kPBA14pxMedium.copyWith(
      color: ColorName.pbaTextSecondary,
    );

    return Align(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: LoginStrings.dontHaveAnAccount,
          style: mainTextStyle,
          children: [
            seperator,
            TextSpan(
              text: LoginStrings.signUpClickableText,
              style: clickableTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
