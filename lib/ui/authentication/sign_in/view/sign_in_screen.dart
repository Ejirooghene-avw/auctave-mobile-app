import 'package:auctave_mobile_app/gen/assets.gen.dart';
import 'package:auctave_mobile_app/gen/colors.gen.dart';
import 'package:auctave_mobile_app/ui/authentication/sign_in/model/sign_in_button_content.dart';
import 'package:auctave_mobile_app/ui/authentication/sign_in/view_model/sign_in_view_model.dart';
import 'package:auctave_mobile_app/ui/authentication/sign_in/widgets/sign_in_widgets.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_strings/sign_in_strings.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_text_style.dart';
import 'package:auctave_mobile_app/ui/core/ui/shared_widgets/app_bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<SignInButtonInfo> buttons = context
        .select<SignInViewModel, List<SignInButtonInfo>>((viewModel) {
          return viewModel.buttons;
        });

    return Scaffold(
      bottomNavigationBar: AppBottomButtonTermsAndPrivacy(
        child: SignInScreenBottomButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0).copyWith(top: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // sign App Logo
              SvgPicture.asset(Assets.logos.signInAppLogo),
              SizedBox(height: 16.0),
              // title
              Text(
                SignInStrings.signUpForAuctave,
                style: AppTextStyle.kPBA28pxBold.copyWith(
                  color: ColorName.pbaTextPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),

              // buttons
              for (var button in buttons) SignInButton(buttonInfo: button),
            ],
          ),
        ),
      ),
    );
  }
}
