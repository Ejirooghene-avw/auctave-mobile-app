import 'package:flutter/material.dart';

class SplashScreenViewModel extends ChangeNotifier {
  bool _proceed = false;
  bool get proceed => _proceed;

  Future<void> initializeApp() async {
    await Future.delayed(const Duration(seconds: 4));
    _proceed = true;
    notifyListeners();
  }
}
