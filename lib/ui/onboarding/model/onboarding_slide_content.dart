import 'package:auctave_mobile_app/ui/core/constants/app_strings/onboarding_strings.dart';

class OnboardingSlideContent {
  final String image;
  final String title;
  final String subTitle;
  final String buttonText;

  OnboardingSlideContent({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.buttonText,
  });

  factory OnboardingSlideContent.fromMap(Map<String, dynamic> map) {
    return OnboardingSlideContent(
      image: map['image'],
      title: map['title'],
      subTitle: map['sub-title'],
      buttonText: map['button-text'],
    );
  }

  static List<OnboardingSlideContent> getOnboardingSlideContent() {
    return OnboardingStrings.slideContent
        .map((slideContent) => OnboardingSlideContent.fromMap(slideContent))
        .toList();
  }
}
