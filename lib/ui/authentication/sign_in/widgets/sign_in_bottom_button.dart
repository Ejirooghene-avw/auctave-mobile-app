import 'package:auctave_mobile_app/ui/core/constants/app_strings/sign_in_strings.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class SignInScreenBottomButton extends StatelessWidget {
  const SignInScreenBottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          SignInStrings.alreadyHaveAnAccount,
          style: AppTextStyle.kPBA14pxRegular.copyWith(
            color: Color(0xFF6B6B6B),
          ),
        ),
        SizedBox(height: 12.0),
        ElevatedButton(
          onPressed: () {},
          child: Text(SignInStrings.loginButton),
        ),
      ],
    );
  }
}
