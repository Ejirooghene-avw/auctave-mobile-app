import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void proceedToNextPage() async {
    await Future.delayed(Duration(seconds: 4), () {
      if (context.mounted) {
        Navigator.pushNamed(context, "/onboarding"); // Find a much better fix
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      proceedToNextPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: LinearProgressIndicator())),
    );
  }
}
