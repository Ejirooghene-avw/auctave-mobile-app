import 'package:auctave_mobile_app/gen/colors.gen.dart';
import 'package:auctave_mobile_app/ui/splash/view_model/splash_screen_view_model.dart';
import 'package:auctave_mobile_app/ui/splash/widgets/splash_loader.dart';
import 'package:auctave_mobile_app/ui/splash/widgets/splash_logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SplashScreenViewModel>().initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    final proceed = context.select<SplashScreenViewModel, bool>(
      (viewModel) => viewModel.proceed,
    );

    final bool isUserLoggedin =
        false; // This is to simulate if the user is Logged In

    if (proceed) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (isUserLoggedin == true) {
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          Navigator.pushReplacementNamed(context, '/onboarding');
        }
      });
    }
    return Scaffold(
      backgroundColor: ColorName.pbaBrandAccent500,
      body: const SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [SplashLogo(), SplashLoader()],
        ),
      ),
    );
  }
}
