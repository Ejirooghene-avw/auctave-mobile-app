import 'package:auctave_mobile_app/gen/colors.gen.dart';
import 'package:auctave_mobile_app/ui/onboarding/view_model/onboarding_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingViewProgressIndicator extends StatelessWidget {
  const OnboardingViewProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingScreenViewModel viewModel = context
        .watch<OnboardingScreenViewModel>();
    return Row(
      children: List.generate(viewModel.numberOfViews, (index) {
        bool isCurrentSlideSameAsIndex = viewModel.slideIndex == index;
        bool isCurrentSlideGreaterThanIndex =
            (viewModel.slideIndex > index) && (viewModel.slideIndex != 0);
        return OnboardingViewProgressIndicatorCell(
          isCurrentSlideSameAsIndex: isCurrentSlideSameAsIndex,
          isCurrentSlideGreaterThanIndex: isCurrentSlideGreaterThanIndex,
        );
      }),
    );
  }
}

class OnboardingViewProgressIndicatorCell extends StatelessWidget {
  final bool isCurrentSlideSameAsIndex;
  final bool isCurrentSlideGreaterThanIndex;

  const OnboardingViewProgressIndicatorCell({
    super.key,
    required this.isCurrentSlideSameAsIndex,
    required this.isCurrentSlideGreaterThanIndex,
  });

  @override
  Widget build(BuildContext context) {
    double defaultCellHeight = 6;
    double defaultCellWidth = double.infinity;
    double cellWidth = defaultCellWidth;
    Color cellColor = Colors.transparent;
    BorderRadius cellBorderRadius = BorderRadius.circular(100.0);
    EdgeInsets cellMargin = EdgeInsets.symmetric(horizontal: 2.0);

    if (isCurrentSlideGreaterThanIndex == true) {
      cellColor = ColorName.pbaBrandAccent600;
    }

    if (isCurrentSlideSameAsIndex) {
      cellWidth = 8.0;
    }

    return Expanded(
      child: Stack(
        children: [
          Container(
            height: defaultCellHeight,
            width: cellWidth,
            margin: cellMargin,
            decoration: BoxDecoration(
              color: cellColor,
              borderRadius: cellBorderRadius,
            ),
          ),
          Container(
            height: defaultCellHeight,
            width: double.infinity,
            margin: cellMargin,
          ),
        ],
      ),
    );
  }
}
