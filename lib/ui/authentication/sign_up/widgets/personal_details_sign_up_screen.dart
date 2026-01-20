import 'package:auctave_mobile_app/gen/colors.gen.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_strings/sign_up_strings.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_text_style.dart';
import 'package:auctave_mobile_app/ui/core/ui/shared_widgets/app_text_fields.dart/app_text_fields.dart';
import 'package:flutter/material.dart';

class PersonalDetailsSignUpScreen extends StatelessWidget {
  const PersonalDetailsSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            SignUpStrings.welcomeToAuctave,
            style: AppTextStyle.kPBA24pxMedium.copyWith(
              color: ColorName.pbaTextPrimary,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            SignUpStrings.createAnAccount,
            style: AppTextStyle.kPBA15pxRegular.copyWith(
              color: ColorName.pbaTextSecondary,
            ),
          ),
          SizedBox(height: 24.0),
          AppTextField(
            label: SignUpStrings.textFieldLabelFullName,
            hint: SignUpStrings.textFieldHintFullName,
          ),
          AppTextField(
            label: SignUpStrings.textFieldLabelEmailAddress,
            hint: SignUpStrings.textFieldHintEmailAddress,
          ),
          // Password
          AppPasswordTextField(),
        ],
      ),
    );
  }
}
