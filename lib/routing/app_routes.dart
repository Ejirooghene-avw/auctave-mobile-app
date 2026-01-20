import 'package:auctave_mobile_app/main.dart';
import 'package:auctave_mobile_app/ui/authentication/sign_in/view/sign_in_screen.dart';
import 'package:auctave_mobile_app/ui/authentication/sign_up/view/sign_up_screen.dart';
import 'package:auctave_mobile_app/ui/onboarding/view/onboarding_screen.dart';
import 'package:auctave_mobile_app/ui/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // routes
  static const splash = "/";
  static const home = "/home";
  static const onboarding = "/onboarding";
  static const signIn = "/sign-in";
  static const logIn = "log-in";
  static const resetPassword = "/reset-password";
  static const signUp = "/sign-up";

  // on generate
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
