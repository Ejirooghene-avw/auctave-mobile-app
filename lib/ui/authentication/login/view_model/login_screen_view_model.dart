import 'dart:developer';

import 'package:flutter/material.dart';

enum LoginButtonType { google, apple, facebook }

class LoginScreenViewModel extends ChangeNotifier {
  // functions
  void processIconButtonPress({required int buttonIndex}) {
    var selectedButton = LoginButtonType.values[buttonIndex];

    log("Button clicked : ${selectedButton.name}");
    switch (selectedButton) {
      case LoginButtonType.google:
        //TDOD: implement google login
        break;
      case LoginButtonType.apple:
        //TDOD: implement apple login
        break;
      case LoginButtonType.facebook:
        //TDOD: implement facebook login

        break;
    }
  }

  void processLoginButtonPress() {
    log("TODO: login Button press function");
  }
}
