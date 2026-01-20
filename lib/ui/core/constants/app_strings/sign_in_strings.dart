import 'package:auctave_mobile_app/gen/assets.gen.dart';

enum SignButtonType { email, google, apple, facebook }

class SignInStrings {
  static const String signButtonLabelEmail = "Continue with Email";
  static const String signButtonLabelGoogle = "Continue with Google";
  static const String signButtonLabelApple = "Continue with Apple";
  static const String signButtonLabelFacebook = "Continue with Facebook";

  static const String alreadyHaveAnAccount = "Already have an account?";
  static const String loginButton = "Log In";

  static const String signUpForAuctave = "Sign up for Auctave";

  static final List<Map<String, dynamic>> signInButtons = [
    {
      "button-icon": Assets.icons.signInWithEmailButtonIcon,
      "button-label": signButtonLabelEmail,
      "button-type": SignButtonType.email,
    },
    {
      "button-icon": Assets.icons.signInWithGoogleButtonIcon,
      "button-label": signButtonLabelGoogle,
      "button-type": SignButtonType.google,
    },
    {
      "button-icon": Assets.icons.signInWithAppleButtonIcon,
      "button-label": signButtonLabelApple,
      "button-type": SignButtonType.apple,
    },
    {
      "button-icon": Assets.icons.signInWithFacebookButtonIcon,
      "button-label": signButtonLabelFacebook,
      "button-type": SignButtonType.facebook,
    },
  ];
}
