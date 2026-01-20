// Onboarding Slide Button
import 'package:auctave_mobile_app/ui/onboarding/view_model/onboarding_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 18.0),
        foregroundColor: Color(0xFFFFFFFF),
        backgroundColor: Color(0xFF000000),
      ),
      onPressed: () {
        if (isNextPageAvailable == true) {
          context.read<OnboardingScreenViewModel>().moveToNextPage();
        } else {
          // TODO: implement sign Up button function
          print("Onboaring Complete : You may proceed to next page");
        }
      },
      child: Text(
        buttonText,
        style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 16.0),
      ),
    );
  }
}
