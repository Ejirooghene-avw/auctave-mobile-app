import 'package:auctave_mobile_app/gen/colors.gen.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_strings/app_strings.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTermsAndPrivacyPolicy extends StatelessWidget {
  const AppTermsAndPrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle mainStyle = AppTextStyle.kPBA12pxRegular.copyWith(
      color: ColorName.pbaTextSecondary,
      decoration: TextDecoration.underline,
    );

    TextStyle clickableStyle = AppTextStyle.kPBA12pxRegular.copyWith(
      color: ColorName.pbaTextPrimary,
      decoration: TextDecoration.underline,
    );

    TextSpan seperator = TextSpan(text: " ");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 46.5),

      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: AppStrings.byContinuingToAgree,
          style: mainStyle,
          children: [
            seperator,
            TextSpan(
              text: AppStrings.termsOfServiceClickableText,
              style: clickableStyle,
            ),
            seperator,
            TextSpan(text: AppStrings.and, style: mainStyle),
            seperator,
            TextSpan(
              text: AppStrings.privacyPolicyClickableText,
              style: clickableStyle,
            ),
          ],
        ),
      ),
    );
  }
}
