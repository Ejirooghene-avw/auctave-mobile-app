import 'package:auctave_mobile_app/ui/splash/widgets/three_dot_loader.dart';
import 'package:flutter/material.dart';

class SplashLoader extends StatelessWidget {
  const SplashLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(bottom: 100.0, child: ThreeDotLoader());
  }
}
