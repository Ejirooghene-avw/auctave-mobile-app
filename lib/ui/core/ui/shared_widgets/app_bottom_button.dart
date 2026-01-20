import 'package:auctave_mobile_app/ui/core/ui/shared_widgets/shared_widgets.dart';
import 'package:flutter/material.dart';

class AppBottomButton extends StatelessWidget {
  final Widget child;
  const AppBottomButton({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ).copyWith(bottom: 8),
        child: child,
      ),
    );
  }
}

class AppBottomButtonTermsAndPrivacy extends StatelessWidget {
  final Widget child;
  const AppBottomButtonTermsAndPrivacy({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ).copyWith(bottom: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [child, SizedBox(height: 24.0), AppTermsAndPrivacyPolicy()],
        ),
      ),
    );
  }
}
