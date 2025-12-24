import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen());
  }
}

//Models
class OnBoardingPageViewContent {
  final String imageAsset;
  final String heading;
  final String subtitle;

  OnBoardingPageViewContent({
    required this.imageAsset,
    required this.heading,
    required this.subtitle,
  });

  static List<OnBoardingPageViewContent> appOnboardingContent = [
    OnBoardingPageViewContent(
      imageAsset: AppAssets.onboardingCarouselWinStartsHere,
      heading: AppTexts.onboardingHeadingTextSlide1,
      subtitle: AppTexts.onboardingSubTitleTextSlide1,
    ),
    OnBoardingPageViewContent(
      imageAsset: AppAssets.onboardingCarouselBidsDoTheWork,
      heading: AppTexts.onboardingHeadingTextSlide2,
      subtitle: AppTexts.onboardingSubTitleTextSlide2,
    ),
    OnBoardingPageViewContent(
      imageAsset: AppAssets.onboardingCarouselWinSafeTrades,
      heading: AppTexts.onboardingHeadingTextSlide3,
      subtitle: AppTexts.onboardingSubTitleTextSlide3,
    ),
  ];
}

//Screens

//Splash
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget get _appLogo => Column(
    children: [Spacer(), SvgPicture.asset(AppAssets.appLogo), Spacer()],
  );

  Widget get _splashScreenLoader => Positioned.fill(
    bottom: 120.0,
    child: Align(alignment: Alignment.bottomCenter, child: ThreeDotLoader()),
  );

  void proceed() {
    bool isUserLoggedIn = false;

    if (isUserLoggedIn == true) {
      // move to homePage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      // onboard User
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(seconds: 4), () {
        proceed();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPBABrandAccent500,
      body: SafeArea(
        child: Center(
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [_appLogo, _splashScreenLoader],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Home Screen")));
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final AppTextStyles appTextStyle = AppTextStyles();

  final PageController pageController = PageController();
  int currentPageViewIndex = 0;

  List<OnBoardingPageViewContent> appOnboardingScreenContent =
      OnBoardingPageViewContent.appOnboardingContent;

  void proceed() {
    if (currentPageViewIndex != appOnboardingScreenContent.length - 1 &&
        currentPageViewIndex >= 0) {
      pageController.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.linear,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    }
  }

  Widget get _onBoardingProgressIndicator => Row(
    children: List.generate(appOnboardingScreenContent.length, (index) {
      return Expanded(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          height: 6.0,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color:
                // (index <= currentPageViewIndex &&
                //     currentPageViewIndex != 0)
                (index <= currentPageViewIndex)
                ? AppColors.kPBABrandAccent600
                : Colors.transparent,
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
      );
    }),
  );

  Widget _buildOnBoardingPageViewTextContent({
    required String title,
    required String subtitle,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: appTextStyle.kPBA32pxMedium.copyWith(
              color: AppColors.kPBATextPrimary,
            ),
          ),
          Text(
            subtitle,
            style: appTextStyle.kPBA16pxMedium.copyWith(
              color: AppColors.kPBATextSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnBoardingPageViewContent({
    required OnBoardingPageViewContent onBoardingPageViewContent,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacer(),
        SvgPicture.asset(onBoardingPageViewContent.imageAsset),
        Spacer(),

        _buildOnBoardingPageViewTextContent(
          title: onBoardingPageViewContent.heading,
          subtitle: onBoardingPageViewContent.subtitle,
        ),
        SizedBox(height: 32.0),
      ],
    );
  }

  Widget get _onBoardingPageView => Expanded(
    child: PageView(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      onPageChanged: (index) {
        setState(() {
          currentPageViewIndex = index;
        });
      },
      children: appOnboardingScreenContent.map((onBoardingPageViewContent) {
        return _buildOnBoardingPageViewContent(
          onBoardingPageViewContent: onBoardingPageViewContent,
        );
      }).toList(),
    ),
  );

  Widget get _onBoardingProceedButton => AppButton.primary(
    onPressed: proceed,
    label: (currentPageViewIndex != appOnboardingScreenContent.length - 1)
        ? AppTexts.onBoardingNextButton
        : AppTexts.onBoardingSignUpButton,
  );

  Widget get _onBoardingProgressCounter => Center(
    child: Text(
      "${currentPageViewIndex + 1}/${appOnboardingScreenContent.length}",
      style: appTextStyle.kPBA14pxMedium.copyWith(
        color: AppColors.kPBATextSecondary,
      ),
    ),
  );

  Widget get _skipButton => TextButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    },
    child: Text(
      AppTexts.onBoardingSkipButton,
      style: appTextStyle.kPBA14pxMedium.copyWith(
        color: AppColors.kPBABrandBlack,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _onBoardingProgressCounter,
        actions: [_skipButton],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0).copyWith(top: 0.0),
          child: Column(
            children: [
              _onBoardingProgressIndicator,
              _onBoardingPageView,
              _onBoardingProceedButton,
            ],
          ),
        ),
      ),
    );
  }
}

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        title: SvgPicture.asset(AppAssets.signInAppLogo),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [Text("Sign in")]),
        ),
      ),
    );
  }
}

//Widgets
//ThreeDotLoader
class ThreeDotLoader extends StatefulWidget {
  const ThreeDotLoader({super.key});

  @override
  State<ThreeDotLoader> createState() => _ThreeDotLoaderState();
}

class _ThreeDotLoaderState extends State<ThreeDotLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            final value = (_controller.value + index * 0.2) % 1;
            final opacity = ((value < 0.5) ? value * 2 : (1 - value) * 2).clamp(
              0.4,
              1.0,
            );

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Opacity(
                opacity: opacity,
                child: const CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.black,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

enum AppButtonType { primary }

//AppButton
class AppButton extends StatelessWidget {
  final AppButtonType appButtonType;
  final VoidCallback? onPressed;
  final String label;
  final TextStyle? labelStyle;
  final ButtonStyle? buttonStyle;

  const AppButton({
    super.key,
    this.appButtonType = AppButtonType.primary,
    required this.onPressed,
    required this.label,
    required this.labelStyle,
    required this.buttonStyle,
  });

  factory AppButton.primary({
    VoidCallback? onPressed,
    required String label,
    TextStyle? labelStyle,
  }) {
    return AppButton(
      label: label,
      appButtonType: AppButtonType.primary,
      onPressed: onPressed,
      labelStyle: AppTextStyles().kPBA16pxMedium.copyWith(
        color: AppColors.kPBABrandWhite,
      ),
      buttonStyle: ElevatedButton.styleFrom(
        backgroundColor: AppColors.kPBABrandBlack,
        foregroundColor: AppColors.kPBABrandWhite,
        padding: EdgeInsets.symmetric(vertical: 18.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return switch (appButtonType) {
      AppButtonType.primary => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: onPressed,
          child: Text(label, style: labelStyle),
        ),
      ),
    };
  }
}

//Others
class AppTheme {}

class AppColors {
  static const kPBABrandAccent500 = Color(0xFFC4F03B);
  static const kPBABrandAccent600 = Color(0xFFB2DA36);

  static const kPBABrandBlack = Color(0xFF000000);
  static const kPBABrandWhite = Color(0xFFFFFFFF);

  static const kPBATextPrimary = Color(0xFF1A1A1A);
  static const kPBATextSecondary = Color(0xFF6B6B6B);
}

class AppAssets {
  //App Logo
  static const String appLogo = "assets/logos/app_logo.svg";

  //OnBoarding
  static const String onboardingCarouselBidsDoTheWork =
      "assets/illustrations/onboarding_carousel_bids_do_the_work.svg";
  static const String onboardingCarouselWinSafeTrades =
      "assets/illustrations/onboarding_carousel_win_safe_trades.svg";
  static const String onboardingCarouselWinStartsHere =
      "assets/illustrations/onboarding_carousel_win_starts_here.svg";

  // sign In
  static const String signInWithFacebookButtonIcon =
      "assets/icons/sign_in_with_facebook_button_icon.svg";
  static const String signInWithAppleButtonIcon =
      "assets/icons/sign_in_with_apple_button_icon.svg";
  static const String signInWithGoogleButtonIcon =
      "assets/icons/sign_in_with_google_button_icon.svg";
  static const String signInWithEmailButtonIcon =
      "assets/icons/sign_in_with_email_button_icon.svg";

  static const String signInAppLogo = "assets/logos/sign_in_app_logo.svg";
}

class AppTexts {
  //Onboarding

  static const String onboardingHeadingTextSlide1 =
      "Your next win starts here.";
  static const String onboardingSubTitleTextSlide1 =
      "Bid in real time, compete fairly, and grab deals before the clock runs out.";
  static const String onboardingHeadingTextSlide2 = "Let the bids do the work.";
  static const String onboardingSubTitleTextSlide2 =
      "List your an item once and watch buyers raise the price for you.";
  static const String onboardingHeadingTextSlide3 = "Safe trades, happy faces.";
  static const String onboardingSubTitleTextSlide3 =
      "Every payment sits in escrow until delivery, so no one loses out.";

  static const String onBoardingNextButton = "Next";
  static const String onBoardingSignUpButton = "Sign Up";
  static const String onBoardingSkipButton = "Skip";
}

class AppTextStyles {
  TextStyle get _interFont => GoogleFonts.inter();

  // inter | 14
  TextStyle get kPBA14pxMedium => _interFont.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
  ); // medium

  // inter | 16
  TextStyle get kPBA16pxMedium => _interFont.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
  ); // medium
  TextStyle get kPBA16pxRegular => _interFont.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
  ); // regular

  // inter | 32
  TextStyle get kPBA32pxMedium => _interFont.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 32.0,
  ); // medium
}
