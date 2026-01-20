import 'package:auctave_mobile_app/ui/core/ui/shared_widgets/shared_widgets.dart';
import 'package:auctave_mobile_app/ui/onboarding/model/onboarding_slide_content.dart';
import 'package:auctave_mobile_app/ui/onboarding/view_model/onboarding_screen_view_model.dart';
import 'package:auctave_mobile_app/ui/onboarding/widgets/onboarding_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageViewController = context
        .select<OnboardingScreenViewModel, PageController>(
          (viewModel) => viewModel.pageViewController,
        );

    List<OnboardingSlideContent> onboardingSlides = context
        .select<OnboardingScreenViewModel, List<OnboardingSlideContent>>(
          (viewModel) => viewModel.slides,
        );

    return Scaffold(
      bottomNavigationBar: AppBottomButton(
        child: OnboardingScreenSlideButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0).copyWith(top: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [OnboardingViewCounter(), OnboardingSkipButton()],
              ),
              SizedBox(height: 12.0),
              OnboardingViewProgressIndicator(),
              SizedBox(height: 68.0),
              Expanded(
                child: PageView(
                  controller: pageViewController,
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: context
                      .read<OnboardingScreenViewModel>()
                      .updateSlideIndex,
                  children: onboardingSlides.map((slideContent) {
                    return OnboardingScreenSlideContent(
                      slideContent: slideContent,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
