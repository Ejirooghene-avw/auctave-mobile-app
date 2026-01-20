import 'package:auctave_mobile_app/gen/colors.gen.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_strings/sign_up_strings.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_text_style.dart';
import 'package:auctave_mobile_app/ui/core/ui/shared_widgets/app_text_fields.dart/app_text_fields.dart';
import 'package:auctave_mobile_app/ui/core/ui/shared_widgets/custom_app_bars/app_bar_back_button_only.dart';
import 'package:auctave_mobile_app/ui/core/ui/shared_widgets/shared_widgets.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBackButtonOnly(),
      bottomNavigationBar: AppBottomButtonTermsAndPrivacy(
        child: ElevatedButton(
          onPressed: () {},
          child: Text(SignUpStrings.createAccountButton),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0).copyWith(top: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
          ),
        ),
      ),
    );
  }
}
