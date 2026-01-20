import 'package:auctave_mobile_app/gen/colors.gen.dart';
import 'package:auctave_mobile_app/routing/app_routes.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_strings/onboarding_strings.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_text_style.dart';
import 'package:auctave_mobile_app/ui/onboarding/view_model/onboarding_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingSkipButton extends StatelessWidget {
  const OnboardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool isNextPageAvailable = context.select<OnboardingScreenViewModel, bool>((
      viewModel,
    ) {
      return viewModel.isNextPageAvailable;
    });
    if (isNextPageAvailable == false) {
      return SizedBox.shrink();
    }

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.signIn);
      },
      child: Text(
        OnboardingStrings.onboardingSkipButton,

        style: AppTextStyle.kPBA14pxMedium.copyWith(color: ColorName.pbaBlack),
      ),
    );
  }
}
