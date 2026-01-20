import 'package:auctave_mobile_app/ui/core/constants/app_strings/sign_in_strings.dart';

class SignInButtonInfo {
  final String icon;
  final String label;
  final SignButtonType buttonType;

  SignInButtonInfo({
    required this.icon,
    required this.label,
    required this.buttonType,
  });

  factory SignInButtonInfo.fromMap(Map<String, dynamic> map) {
    return SignInButtonInfo(
      icon: map['button-icon'],
      label: map['button-label'],
      buttonType: map['button-type'],
    );
  }

  static List<SignInButtonInfo> getOnboardingSlideContent() {
    return SignInStrings.signInButtons
        .map((button) => SignInButtonInfo.fromMap(button))
        .toList();
  }
}
