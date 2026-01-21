import 'package:auctave_mobile_app/gen/colors.gen.dart';
import 'package:auctave_mobile_app/ui/authentication/login/view_model/login_screen_view_model.dart';
import 'package:auctave_mobile_app/ui/authentication/login/widgets/login_widgets.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_strings/app_strings.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_strings/login_strings.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_text_style.dart';
import 'package:auctave_mobile_app/ui/core/ui/shared_widgets/app_text_fields.dart/app_text_fields.dart';
import 'package:auctave_mobile_app/ui/core/ui/shared_widgets/custom_app_bars/app_bar_back_button_only.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBackButtonOnly(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0).copyWith(top: 40.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LoginStrings.welcomeBack,
                  style: AppTextStyle.kPBA24pxMedium.copyWith(
                    color: ColorName.pbaTextPrimary,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  LoginStrings.loginToKeepBidding,
                  style: AppTextStyle.kPBA15pxRegular.copyWith(
                    color: ColorName.pbaTextSecondary,
                  ),
                ),
                SizedBox(height: 24.0),
                AppTextField(
                  label: AppStrings.textFieldLabelEmailAddress,
                  hint: AppStrings.textFieldHintEmailAddress,
                ),
                AppPasswordTextField(),
                SizedBox(height: 8.0),
                ForgotPasswordClickable(),
                SizedBox(height: 40.0),

                ElevatedButton(
                  onPressed: () {
                    context
                        .read<LoginScreenViewModel>()
                        .processLoginButtonPress();
                  },
                  child: Text(AppStrings.loginButton),
                ),

                SizedBox(height: 12.0),
                DontHaveAnAccountClickable(),
                SizedBox(height: 72.0),

                Align(
                  alignment: Alignment.center,
                  child: Text(
                    LoginStrings.orContinueWith,
                    style: AppTextStyle.kPBA14pxRegular.copyWith(
                      color: ColorName.pbaTextSecondary,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: List.generate(
                    LoginStrings.loginButtonAssets.length,
                    (index) {
                      String iconPath = LoginStrings.loginButtonAssets[index];
                      return LoginScreenIconButton(
                        onPressed: () {
                          context
                              .read<LoginScreenViewModel>()
                              .processIconButtonPress(buttonIndex: index);
                        },
                        iconPath: iconPath,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
