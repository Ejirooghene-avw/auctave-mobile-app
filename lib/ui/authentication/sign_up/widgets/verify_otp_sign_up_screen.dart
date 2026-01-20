import 'package:auctave_mobile_app/gen/colors.gen.dart';
import 'package:auctave_mobile_app/ui/authentication/sign_up/widgets/sign_up_widgets.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_strings/sign_up_strings.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class VerifyOTPSignUpScreen extends StatelessWidget {
  const VerifyOTPSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            SignUpStrings.otpVerification,
            style: AppTextStyle.kPBA24pxMedium.copyWith(
              color: ColorName.pbaTextPrimary,
            ),
          ),
          SizedBox(height: 16.0),
          OTPVerificationSubHeadingPhoneNumber(),
          SizedBox(height: 24.0),
          OTPVerificationInputField(),
        ],
      ),
    );
  }
}
