import 'package:auctave_mobile_app/routing/app_routes.dart';
import 'package:auctave_mobile_app/ui/authentication/sign_in/model/sign_in_button_content.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_strings/sign_in_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInButton extends StatelessWidget {
  final SignInButtonInfo buttonInfo;
  const SignInButton({super.key, required this.buttonInfo});

  void processButtonClick({
    required BuildContext context,
    required SignButtonType buttonType,
  }) {
    switch (buttonType) {
      case SignButtonType.email:
        Navigator.pushNamed(context, AppRoutes.signUp);
        break;
      case SignButtonType.google:
        //TODO: process sign in with google
        break;
      case SignButtonType.apple:
        //TODO: process sign in with apple
        break;
      case SignButtonType.facebook:
        //TODO: process sign in with facebook
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: OutlinedButton.icon(
        onPressed: () {
          processButtonClick(
            context: context,
            buttonType: buttonInfo.buttonType,
          );
        },
        icon: SvgPicture.asset(buttonInfo.icon),
        label: Text(buttonInfo.label),
      ),
    );
  }
}
