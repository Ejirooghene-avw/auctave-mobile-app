import 'package:auctave_mobile_app/ui/authentication/sign_in/model/sign_in_button_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInButton extends StatelessWidget {
  final SignInButtonInfo buttonInfo;
  const SignInButton({super.key, required this.buttonInfo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: SvgPicture.asset(buttonInfo.icon),
        label: Text(buttonInfo.label),
      ),
    );
  }
}
