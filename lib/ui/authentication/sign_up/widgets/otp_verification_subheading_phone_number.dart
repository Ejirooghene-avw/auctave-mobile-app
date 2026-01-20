import 'package:auctave_mobile_app/gen/colors.gen.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_strings/sign_up_strings.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class OTPVerificationSubHeadingPhoneNumber extends StatelessWidget {
  const OTPVerificationSubHeadingPhoneNumber({super.key});

  String formatPhoneNumber({required int phoneNumber}) {
    String output = "+234 $phoneNumber.";

    return output;
  }

  @override
  Widget build(BuildContext context) {
    TextSpan seperator = TextSpan(text: " ");
    TextSpan spanDivider = TextSpan(text: "\n");

    TextStyle clickableTextStyle = AppTextStyle.kPBA15pxMedium.copyWith(
      color: ColorName.pbaTextPrimary,
    );

    TextStyle mainTextStyle = AppTextStyle.kPBA15pxRegular.copyWith(
      color: ColorName.pbaTextSecondary,
    );

    return RichText(
      text: TextSpan(
        text: SignUpStrings.weJustSent4DigitCodeToNumber,
        style: mainTextStyle,
        children: [
          seperator,
          TextSpan(
            text: formatPhoneNumber(phoneNumber: 9126454646),
            style: clickableTextStyle,
          ),
          spanDivider,
          TextSpan(
            text: SignUpStrings.enterCodeToVerifyNumber,
            style: mainTextStyle,
          ),
        ],
      ),
    );
  }
}
