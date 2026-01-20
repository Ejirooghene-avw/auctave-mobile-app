import 'package:auctave_mobile_app/gen/colors.gen.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_text_style.dart';
import 'package:auctave_mobile_app/ui/onboarding/model/onboarding_slide_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingScreenSlideContent extends StatelessWidget {
  final OnboardingSlideContent slideContent;
  const OnboardingScreenSlideContent({super.key, required this.slideContent});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(slideContent.image),
        SizedBox(height: 56.0),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.50,
          child: Text(
            slideContent.title,
            style: AppTextStyle.kPBA32pxMedium.copyWith(
              color: ColorName.pbaTextPrimary,
            ),
          ),
        ),
        SizedBox(height: 16.0),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.52,
          child: Text(
            slideContent.subTitle,
            style: AppTextStyle.kPBA14pxRegular.copyWith(
              color: ColorName.pbaTextSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
