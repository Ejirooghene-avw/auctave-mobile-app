import 'package:auctave_mobile_app/ui/onboarding/model/onboarding_slide_content.dart';
import 'package:flutter/material.dart';

class OnboardingScreenViewModel extends ChangeNotifier {
  //Variables
  final PageController _onboardingViewPageController = PageController();
  int _currentSlideIndex = 0;
  final List<OnboardingSlideContent> _slideContents =
      OnboardingSlideContent.getOnboardingSlideContent();

  // Gestters
  PageController get pageViewController => _onboardingViewPageController;
  List<OnboardingSlideContent> get slides => _slideContents;
  int get slideIndex => _currentSlideIndex;
  int get slideIndexDisplay => _currentSlideIndex + 1;
  int get numberOfViews => _slideContents.length;
  bool get isNextPageAvailable {
    return slideIndexDisplay < numberOfViews;
  }

  OnboardingSlideContent get currentSlideContent {
    return slides[slideIndex];
  }

  // Functions
  void moveToNextPage() {
    _onboardingViewPageController.nextPage(
      duration: Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }

  void updateSlideIndex(int newIndexValue) {
    _currentSlideIndex = newIndexValue;
    notifyListeners();
  }
}
