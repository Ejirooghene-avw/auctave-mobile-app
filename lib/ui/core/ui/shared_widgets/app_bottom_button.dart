import 'package:flutter/material.dart';

class AppBottomButton extends StatelessWidget {
  final Widget child;
  const AppBottomButton({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: child,
      ),
    );
  }
}
