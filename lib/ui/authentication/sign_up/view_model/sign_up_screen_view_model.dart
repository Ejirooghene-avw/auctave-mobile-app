import 'package:auctave_mobile_app/ui/core/constants/app_strings/sign_up_strings.dart';
import 'package:flutter/material.dart';

enum SignUpButtons { createAccount, sendCode, verify }

class SignUpScreenViewModel extends ChangeNotifier {
  // variables
  PageController _signUpViewPageController = PageController();
  int _currentViewIndex = 0;

  // getters
  PageController get pageController => _signUpViewPageController;
  bool get shouldExit {
    return _currentViewIndex <= 0;
  }

  String get viewButtonText {
    SignUpButtons currentButton = SignUpButtons.values[_currentViewIndex];
    switch (currentButton) {
      case SignUpButtons.createAccount:
        return SignUpStrings.createAccountButton;
      case SignUpButtons.sendCode:
        return SignUpStrings.sendCodeButton;
      case SignUpButtons.verify:
        return SignUpStrings.verifyButton;
    }
  }

  // Functions
  void moveToNextPage() {
    _signUpViewPageController.nextPage(
      duration: Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }

  void moveToPreviousPage() {
    _signUpViewPageController.previousPage(
      duration: Duration(milliseconds: 400),
      curve: Curves.linear,
    );
  }

  void updateSlideIndex(int newIndexValue) {
    _currentViewIndex = newIndexValue;
    notifyListeners();
  }

  void proceed() {
    moveToNextPage();
  }
}
