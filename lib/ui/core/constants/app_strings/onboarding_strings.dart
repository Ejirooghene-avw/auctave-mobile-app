import 'package:auctave_mobile_app/gen/assets.gen.dart';

class OnboardingStrings {
  static const String onboardingSlideDetailsTitle1 =
      "Your next win starts here.";
  static const String onboardingSlideDetailsTitle2 =
      "Let the bids do the work.";
  static const String onboardingSlideDetailsTitle3 =
      "Safe trades, happy faces.";

  static const String onboardingSlideDetailsSubTitle1 =
      "Bid in real time, compete fairly, and grab deals before the clock runs out.";
  static const String onboardingSlideDetailsSubTitle2 =
      "List your an item once and watch buyers raise the price for you.";
  static const String onboardingSlideDetailsSubTitle3 =
      "Every payment sits in escrow until delivery, so no one loses out.";

  static const String onboardingSlideButtonNext = "Next";
  static const String onboardingSlideButtonSignUp = "Sign Up";

  static final List<Map<String, String>> slideContent = [
    {
      "image": Assets.illustrations.onboardingCarouselWinStartsHere,
      "title": onboardingSlideDetailsTitle1,
      "sub-title": onboardingSlideDetailsSubTitle1,
      "button-text": onboardingSlideButtonNext,
    },

    {
      "image": Assets.illustrations.onboardingCarouselBidsDoTheWork,
      "title": onboardingSlideDetailsTitle2,
      "sub-title": onboardingSlideDetailsSubTitle2,
      "button-text": onboardingSlideButtonNext,
    },

    {
      "image": Assets.illustrations.onboardingCarouselWinSafeTrades,
      "title": onboardingSlideDetailsTitle3,
      "sub-title": onboardingSlideDetailsSubTitle3,
      "button-text": onboardingSlideButtonSignUp,
    },
  ];
}
