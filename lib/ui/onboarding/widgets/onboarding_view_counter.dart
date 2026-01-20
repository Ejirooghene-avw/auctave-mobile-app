import 'package:auctave_mobile_app/gen/colors.gen.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_text_style.dart';
import 'package:auctave_mobile_app/ui/onboarding/view_model/onboarding_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingViewCounter extends StatelessWidget {
  const OnboardingViewCounter({super.key});

  @override
  Widget build(BuildContext context) {
    int numberOfViews = context.select<OnboardingScreenViewModel, int>((
      viewModel,
    ) {
      return viewModel.numberOfViews;
    });

    int currentSlideIndex = context.select<OnboardingScreenViewModel, int>((
      viewModel,
    ) {
      return viewModel.slideIndexDisplay;
    });

    return Text(
      [currentSlideIndex, numberOfViews].join("/"),
      style: AppTextStyle.kPBA14pxMedium.copyWith(
        color: ColorName.pbaTextSecondary,
      ),
    );
  }
}
