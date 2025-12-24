import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  double progress = 1;

  void movePageForward() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );

    setState(() {
      progress++;
    });
  }

  void moveToSignUpPage() {
    Navigator.pushNamed(context, "/sign-up");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(child: Text("${progress.toInt()}/3")),
        actions: [TextButton(onPressed: moveToSignUpPage, child: Text("Skip"))],
      ),
      body: SafeArea(
        child: Column(
          children: [
            LinearProgressIndicator(value: progress / 3),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  Center(child: Text("Screen 1")),
                  Center(child: Text("Screen 2")),
                  Center(child: Text("Screen 3")),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: progress >= 3 ? moveToSignUpPage : movePageForward,
              child: Text(progress >= 3 ? "Sign Up" : "Proceed"),
            ),
          ],
        ),
      ),
    );
  }
}
