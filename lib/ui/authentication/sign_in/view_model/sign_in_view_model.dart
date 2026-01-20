import 'package:auctave_mobile_app/ui/authentication/sign_in/model/sign_in_button_content.dart';
import 'package:flutter/material.dart';

class SignInViewModel extends ChangeNotifier {
  // variables
  final List<SignInButtonInfo> _signInButtons =
      SignInButtonInfo.getOnboardingSlideContent();

  // getters
  List<SignInButtonInfo> get buttons => _signInButtons;

  // functions
}
