// Onboarding Slide Button
import 'package:auctave_mobile_app/routing/app_routes.dart';
import 'package:auctave_mobile_app/ui/onboarding/view_model/onboarding_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingScreenSlideButton extends StatelessWidget {
  const OnboardingScreenSlideButton({super.key});

  @override
  Widget build(BuildContext context) {
    String buttonText = context.select<OnboardingScreenViewModel, String>((
      viewModel,
    ) {
      return viewModel.currentSlideContent.buttonText;
    });

    bool isNextPageAvailable = context.select<OnboardingScreenViewModel, bool>((
      viewModel,
    ) {
      return viewModel.isNextPageAvailable;
    });

    return ElevatedButton(
      onPressed: () {
        if (isNextPageAvailable == true) {
          context.read<OnboardingScreenViewModel>().moveToNextPage();
        } else {
          Navigator.pushNamed(context, AppRoutes.signIn);
        }
      },
      child: Text(buttonText),
    );
  }
}
