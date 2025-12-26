import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class SignInButtonListData {
  final String buttonAsset;
  final String buttonLabel;
  final void Function(BuildContext context) onPressed;

  SignInButtonListData({
    required this.buttonAsset,
    required this.buttonLabel,
    required this.onPressed,
  });

  static List<SignInButtonListData> listOfSignInButtonListData = [
    SignInButtonListData(
      buttonAsset: AppAssets.signInWithEmailButtonIcon,
      buttonLabel: AppTexts.continueWithEmail,
      onPressed: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignUpPersonalDetailsScreen(),
          ),
        );
      },
    ),
    SignInButtonListData(
      buttonAsset: AppAssets.signInWithGoogleButtonIcon,
      buttonLabel: AppTexts.continueWithGoogle,
      onPressed: (context) {},
    ),
    SignInButtonListData(
      buttonAsset: AppAssets.signInWithAppleButtonIcon,
      buttonLabel: AppTexts.continueWithApple,
      onPressed: (context) {},
    ),
    SignInButtonListData(
      buttonAsset: AppAssets.signInWithFacebookButtonIcon,
      buttonLabel: AppTexts.continueWithFacebook,
      onPressed: (context) {},
    ),
  ];
}

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppTextStyles appTextStyles = AppTextStyles();

    Widget buildSignInButton({required SignInButtonListData signInButtonData}) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: AppButton.outlinedIcon(
          label: signInButtonData.buttonLabel,
          icon: SvgPicture.asset(signInButtonData.buttonAsset),
          onPressed: () {
            signInButtonData.onPressed(context);
          },
        ),
      );
    }

    Widget buildSignInButtons() {
      List<SignInButtonListData> signInButtonListData =
          SignInButtonListData.listOfSignInButtonListData;

      return Column(
        children: signInButtonListData.map((signInButtonData) {
          return buildSignInButton(signInButtonData: signInButtonData);
        }).toList(),
      );
    }

    Widget buildSignInHeader() {
      return Text(
        AppTexts.signUpForOctave,
        style: appTextStyles.kPBA24pxBold.copyWith(
          color: AppColors.kPBATextPrimary,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        title: SvgPicture.asset(AppAssets.signInAppLogo),
        centerTitle: true,
      ),

      bottomNavigationBar: AuthenticationBottomButton(
        child: SignUpButtonWithTermsAndPolicy.login(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreeen()),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              buildSignInHeader(),
              SizedBox(height: 24.0),
              buildSignInButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

//Sign Up -Personal Details

class SignUpPersonalDetailsScreen extends StatelessWidget {
  const SignUpPersonalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppTextStyles appTextStyles = AppTextStyles();
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: AuthenticationBottomButton(
        child: SignUpButtonWithTermsAndPolicy.createAccount(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppTexts.welcomeToAuctave,
                  style: appTextStyles.kPBA24pxMedium.copyWith(
                    color: AppColors.kPBATextPrimary,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  AppTexts.createAnAccountToGetStarted,
                  style: appTextStyles.kPBA16pxRegular.copyWith(
                    color: AppColors.kPBATextSecondary,
                  ),
                ),
                SizedBox(height: 32.0),
                AppFormTextField.fullName(),
                SizedBox(height: 16.0),
                AppFormTextField.email(),
                SizedBox(height: 16.0),
                AppFormTextField.password(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Login
class LoginScreeen extends StatelessWidget {
  const LoginScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Login Screen")));
  }
}

// Sign Up - verify number
class SignUpVerifyPhoneNumberScreen extends StatelessWidget {
  const SignUpVerifyPhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppTextStyles appTextStyles = AppTextStyles();
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: AuthenticationBottomButton(
        child: SignUpButtonWithTermsAndPolicy.sendCode(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppTexts.verifyPhoneNumber,
                  style: appTextStyles.kPBA24pxMedium.copyWith(
                    color: AppColors.kPBATextPrimary,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  AppTexts.enterYourPhoneNumber,
                  style: appTextStyles.kPBA16pxRegular.copyWith(
                    color: AppColors.kPBATextSecondary,
                  ),
                ),
                SizedBox(height: 32.0),
                AppFormTextField.phoneNumber(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Sign Up - verify OTP
class SignUpVerifyOTPScreen extends StatelessWidget {
  const SignUpVerifyOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppTextStyles appTextStyles = AppTextStyles();

    final String enteredPhoneNumber = "+234 9126454646";
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: AuthenticationBottomButton(
        child: SignUpButtonWithTermsAndPolicy.verify(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppTexts.otpVerification,
                  style: appTextStyles.kPBA24pxMedium.copyWith(
                    color: AppColors.kPBATextPrimary,
                  ),
                ),
                SizedBox(height: 16.0),
                RichText(
                  text: TextSpan(
                    text: AppTexts.weJustSendCodeToPhoneNumber,
                    style: appTextStyles.kPBA16pxRegular.copyWith(
                      color: AppColors.kPBATextSecondary,
                    ),
                    children: [
                      TextSpan(text: " "),
                      TextSpan(
                        text: "$enteredPhoneNumber.",
                        style: appTextStyles.kPBA16pxRegular.copyWith(
                          color: AppColors.kPBATextPrimary,
                        ),
                      ),
                      TextSpan(text: "\n"),
                      TextSpan(
                        text: AppTexts.enterCodeToVerifyNumber,
                        style: appTextStyles.kPBA16pxRegular.copyWith(
                          color: AppColors.kPBABrandBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.0),
                AppOTPField(length: 4),
                SizedBox(height: 24.0),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: AppTexts.didNotReceiveOTP,
                      style: appTextStyles.kPBA14pxMedium.copyWith(
                        color: AppColors.kPBATextSecondary,
                      ),
                      children: [
                        TextSpan(text: " "),
                        TextSpan(
                          text: AppTexts.resendOTPClickableText,
                          style: appTextStyles.kPBA14pxMedium.copyWith(
                            color: AppColors.kPBABrandBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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

enum AppButtonType { primary, outlinedIcon }

//AppButton
class AppButton extends StatelessWidget {
  final AppButtonType appButtonType;
  final VoidCallback? onPressed;
  final String label;
  final TextStyle? labelStyle;
  final ButtonStyle? buttonStyle;

  final Widget? buttonIcon;

  const AppButton({
    super.key,
    this.appButtonType = AppButtonType.primary,
    required this.onPressed,
    required this.label,
    required this.labelStyle,
    required this.buttonStyle,
    this.buttonIcon,
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

  factory AppButton.outlinedIcon({
    VoidCallback? onPressed,
    required String label,
    required Widget icon,
  }) {
    return AppButton(
      label: label,
      appButtonType: AppButtonType.outlinedIcon,
      onPressed: onPressed,
      buttonIcon: icon,
      labelStyle: AppTextStyles().kPBA16pxMedium.copyWith(
        color: AppColors.kPBABrandBlack,
      ),
      buttonStyle: OutlinedButton.styleFrom(
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
      AppButtonType.outlinedIcon => SizedBox(
        width: double.infinity,
        child: OutlinedButton.icon(
          icon: buttonIcon,
          onPressed: onPressed,
          style: buttonStyle,
          label: Text(label, style: labelStyle),
        ),
      ),
    };
  }
}

class AuthenticationBottomButton extends StatelessWidget {
  final Widget child;
  const AuthenticationBottomButton({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(padding: EdgeInsetsGeometry.all(16.0), child: child),
    );
  }
}

class AppTermsAndPolicies extends StatelessWidget {
  const AppTermsAndPolicies({super.key});

  @override
  Widget build(BuildContext context) {
    AppTextStyles appTextStyles = AppTextStyles();

    final TextStyle clickableTextStyle = appTextStyles.kPBA12pxRegular.copyWith(
      color: AppColors.kPBATextPrimary,
      decoration: TextDecoration.underline,
    );

    final TextStyle defaultTextStyle = appTextStyles.kPBA12pxRegular.copyWith(
      color: AppColors.kPBATextSecondary,
    );

    TextSpan spacing() {
      return TextSpan(text: " ");
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.5),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: AppTexts.termsAndPolicy,
          style: defaultTextStyle,
          children: [
            spacing(),
            TextSpan(
              text: AppTexts.clickableTermsAndService,
              style: clickableTextStyle,
            ),
            spacing(),
            TextSpan(text: AppTexts.termsAndPolicyAnd, style: defaultTextStyle),
            spacing(),
            TextSpan(
              text: AppTexts.clickablePrivacyPolicy,
              style: clickableTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpButtonWithTermsAndPolicy extends StatelessWidget {
  final Widget? topWidget;
  final String label;
  final Function(BuildContext context) onPressed;

  const SignUpButtonWithTermsAndPolicy({
    super.key,
    required this.label,
    required this.onPressed,
    this.topWidget,
  });

  factory SignUpButtonWithTermsAndPolicy.login({
    required VoidCallback onPressed,
  }) {
    AppTextStyles appTextStyles = AppTextStyles();

    final alreadyHaveAnAccount = Text(
      AppTexts.alreadyHaveAnAccount,
      style: appTextStyles.kPBA14pxMedium.copyWith(
        color: AppColors.kPBATextSecondary,
      ),
    );

    return SignUpButtonWithTermsAndPolicy(
      topWidget: alreadyHaveAnAccount,
      label: AppTexts.loginButton,
      onPressed: (context) => onPressed,
    );
  }

  factory SignUpButtonWithTermsAndPolicy.createAccount() {
    return SignUpButtonWithTermsAndPolicy(
      label: AppTexts.createAccountButton,
      onPressed: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignUpVerifyPhoneNumberScreen(),
          ),
        );
      },
    );
  }

  factory SignUpButtonWithTermsAndPolicy.sendCode() {
    return SignUpButtonWithTermsAndPolicy(
      label: AppTexts.sendCodeButton,
      onPressed: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignUpVerifyOTPScreen()),
        );
      },
    );
  }

  factory SignUpButtonWithTermsAndPolicy.verify() {
    return SignUpButtonWithTermsAndPolicy(
      label: AppTexts.verifyButton,
      onPressed: (context) {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return AppSuccessModalBottomSheet();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        topWidget ?? SizedBox.shrink(),
        SizedBox(height: 12.0),
        AppButton.primary(
          label: label,
          onPressed: () {
            onPressed(context);
          },
        ),
        SizedBox(height: 24.0),
        AppTermsAndPolicies(),
      ],
    );
  }
}

class AppFormTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? editingController;
  final bool isPasswordFormField;
  final bool isPhoneNumber;

  const AppFormTextField({
    super.key,
    required this.label,
    required this.hint,
    this.editingController,
    this.isPasswordFormField = false,
    this.isPhoneNumber = false,
  });

  factory AppFormTextField.fullName({
    TextEditingController? editingController,
  }) {
    return AppFormTextField(
      label: AppTexts.fullNameTextFieldLabel,
      hint: AppTexts.fullNameTextFieldHint,
      editingController: editingController,
    );
  }

  factory AppFormTextField.email({TextEditingController? editingController}) {
    return AppFormTextField(
      label: AppTexts.emailTextFieldLabel,
      hint: AppTexts.emailTextFieldHint,
      editingController: editingController,
    );
  }

  factory AppFormTextField.password({
    TextEditingController? editingController,
  }) {
    return AppFormTextField(
      label: AppTexts.passwordTextFieldLabel,
      hint: AppTexts.passwordTextFieldHint,
      editingController: editingController,
      isPasswordFormField: true,
    );
  }

  factory AppFormTextField.phoneNumber({
    TextEditingController? editingController,
  }) {
    return AppFormTextField(
      label: AppTexts.phoneNumberTextFieldLabel,
      hint: AppTexts.phoneNumberTextFieldHint,
      editingController: editingController,
      isPhoneNumber: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    AppTextStyles appTextStyles = AppTextStyles();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: appTextStyles.kPBA14pxMedium.copyWith(
            color: AppColors.kPBATextPrimary,
          ),
        ),
        SizedBox(height: 8.0),
        (isPasswordFormField == true)
            ? AppPasswordTextField(
                textFieldHint: hint,
                editingController: editingController,
              )
            : (isPhoneNumber == true)
            ? AppPhoneNumberTextField(
                textFieldHint: hint,
                editingController: editingController,
              )
            : AppTextField(
                textFieldHint: hint,
                editingController: editingController,
              ),
      ],
    );
  }
}

class AppTextField extends StatelessWidget {
  final String? textFieldHint;
  final TextEditingController? editingController;
  const AppTextField({super.key, this.textFieldHint, this.editingController});

  @override
  Widget build(BuildContext context) {
    AppTextStyles appTextStyles = AppTextStyles();

    final BorderRadius appTextFieldBorderRadius = BorderRadius.circular(8.0);

    final OutlineInputBorder activeBorder = OutlineInputBorder(
      borderSide: BorderSide(width: 1.5, color: AppColors.kPBABrandBlackAccent),
      borderRadius: appTextFieldBorderRadius,
    );

    final OutlineInputBorder inactiveBorder = OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: AppColors.kPBABrandOutline),
      borderRadius: appTextFieldBorderRadius,
    );

    final appTextFieldDecoration = InputDecoration(
      border: inactiveBorder,
      enabledBorder: inactiveBorder,
      focusedBorder: activeBorder,
      hintText: textFieldHint,
      hintStyle: appTextStyles.kPBA16pxRegular.copyWith(
        color: AppColors.kPBATextInactive,
      ),
    );

    return TextField(
      cursorColor: AppColors.kPBABrandBlack,
      controller: editingController,
      style: appTextStyles.kPBA16pxRegular.copyWith(
        color: AppColors.kPBATextPrimary,
      ),
      decoration: appTextFieldDecoration,
    );
  }
}

class AppPhoneNumberTextField extends StatelessWidget {
  final String? textFieldHint;
  final TextEditingController? editingController;
  const AppPhoneNumberTextField({
    super.key,
    this.textFieldHint,
    this.editingController,
  });

  @override
  Widget build(BuildContext context) {
    AppTextStyles appTextStyles = AppTextStyles();

    final BorderRadius appTextFieldBorderRadius = BorderRadius.circular(8.0);

    final OutlineInputBorder activeBorder = OutlineInputBorder(
      borderSide: BorderSide(width: 1.5, color: AppColors.kPBABrandBlackAccent),
      borderRadius: appTextFieldBorderRadius,
    );

    final OutlineInputBorder inactiveBorder = OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: AppColors.kPBABrandOutline),
      borderRadius: appTextFieldBorderRadius,
    );

    final appTextFieldDecoration = InputDecoration(
      border: inactiveBorder,
      enabledBorder: inactiveBorder,
      focusedBorder: activeBorder,
      hintText: textFieldHint,
      hintStyle: appTextStyles.kPBA16pxRegular.copyWith(
        color: AppColors.kPBATextInactive,
      ),
    );

    return TextField(
      keyboardType: TextInputType.phone,
      cursorColor: AppColors.kPBABrandBlack,
      controller: editingController,
      style: appTextStyles.kPBA16pxRegular.copyWith(
        color: AppColors.kPBATextPrimary,
      ),
      decoration: appTextFieldDecoration,
    );
  }
}

class AppPasswordTextField extends StatefulWidget {
  final String? textFieldHint;
  final TextEditingController? editingController;
  const AppPasswordTextField({
    super.key,
    this.textFieldHint,
    this.editingController,
  });

  @override
  State<AppPasswordTextField> createState() => _AppPasswordTextFieldState();
}

class _AppPasswordTextFieldState extends State<AppPasswordTextField> {
  AppTextStyles appTextStyles = AppTextStyles();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final BorderRadius appTextFieldBorderRadius = BorderRadius.circular(8.0);

    final OutlineInputBorder activeBorder = OutlineInputBorder(
      borderSide: BorderSide(width: 1.5, color: AppColors.kPBABrandBlackAccent),
      borderRadius: appTextFieldBorderRadius,
    );

    final OutlineInputBorder inactiveBorder = OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: AppColors.kPBABrandOutline),
      borderRadius: appTextFieldBorderRadius,
    );

    final appTextFieldDecoration = InputDecoration(
      border: inactiveBorder,
      enabledBorder: inactiveBorder,
      focusedBorder: activeBorder,
      hintText: widget.textFieldHint,
      hintStyle: appTextStyles.kPBA16pxRegular.copyWith(
        color: AppColors.kPBATextInactive,
      ),
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            isPasswordVisible = !isPasswordVisible;
          });
        },
        icon: Icon(
          isPasswordVisible == false
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: AppColors.kPBATextInactive,
        ),
      ),
    );

    return TextField(
      obscureText: !isPasswordVisible,
      cursorColor: AppColors.kPBABrandBlack,
      controller: widget.editingController,
      style: appTextStyles.kPBA16pxRegular.copyWith(
        color: AppColors.kPBATextPrimary,
      ),
      decoration: appTextFieldDecoration,
    );
  }
}

// App OTP Field

class AppOTPField extends StatefulWidget {
  final int length;
  final void Function(String otp)? onCompleted;

  const AppOTPField({super.key, this.length = 6, this.onCompleted});

  @override
  State<AppOTPField> createState() => _AppOTPFieldState();
}

class _AppOTPFieldState extends State<AppOTPField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  final AppTextStyles appTextStyles = AppTextStyles();

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes.first.requestFocus();
    });
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < widget.length - 1) {
        _focusNodes[index + 1].requestFocus();
      }
    }

    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    final otp = _controllers.map((c) => c.text).join();
    if (otp.length == widget.length) {
      widget.onCompleted?.call(otp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: List.generate(widget.length, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          width: 54,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(1),
            ],
            maxLength: 1,
            style: appTextStyles.kPBA28pxMedium.copyWith(
              color: AppColors.kPBATextPrimary,
            ),
            decoration: InputDecoration(
              counterText: '',
              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.5,
                  color: AppColors.kPBATextSecondary,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.5,
                  color: AppColors.kPBATextSecondary,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.5,
                  color: AppColors.kPBABrandBlackAccent,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: (value) => _onChanged(value, index),
          ),
        );
      }),
    );
  }
}

// App Success Modal Bottom SHEET
class AppSuccessModalBottomSheet extends StatefulWidget {
  const AppSuccessModalBottomSheet({super.key});

  @override
  State<AppSuccessModalBottomSheet> createState() =>
      _AppSuccessModalBottomSheetState();
}

class _AppSuccessModalBottomSheetState
    extends State<AppSuccessModalBottomSheet> {
  bool isModalSheetLoading = true;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 4), () {
      if (mounted) {
        setState(() => isModalSheetLoading = false);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppTextStyles appTextStyles = AppTextStyles();
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        decoration: BoxDecoration(
          color: AppColors.kPBABrandWhite,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: (isModalSheetLoading == true)
            ? AnimatedContainer(
                duration: Duration(milliseconds: 800),
                height: MediaQuery.of(context).size.height * 0.24,
                child: Center(child: CircularProgressIndicator.adaptive()),
              )
            : AnimatedContainer(
                duration: Duration(milliseconds: 800),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(AppAssets.suceessModalBottomSheetIcon),
                    SizedBox(height: 16.0),
                    Text(
                      AppTexts.youAreIn,
                      style: appTextStyles.kPBA20pxMedium.copyWith(
                        color: AppColors.kPBATextPrimary,
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      AppTexts.yourAuctaveAccountIsLive,
                      style: appTextStyles.kPBA14pxRegular.copyWith(
                        color: AppColors.kPBATextSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24.0),
                    AppButton.primary(
                      label: AppTexts.closeButton,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
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

  static const kPBABrandOutline = Color(0xFFE5E5E5);

  static const kPBATextInactive = Color(0xFFA5A5A5);

  static const kPBABrandBlackAccent = Color(0xFF1E1E1E);
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

  static const String suceessModalBottomSheetIcon =
      "assets/icons/success_bottom_sheet_icon_BPA.svg";
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

  //Sign in
  static const String signUpForOctave = "Sign up for Auctave";

  static const String continueWithEmail = "Continue with Email";
  static const String continueWithGoogle = "Continue with Google";
  static const String continueWithApple = "Continue with Apple";
  static const String continueWithFacebook = "Continue with Facebook";

  static const String alreadyHaveAnAccount = "Already have an account?";

  static const String loginButton = "Log in";

  static const String clickableTermsAndService = "Terms of Service";
  static const String clickablePrivacyPolicy = "Privacy Policy";
  static const String termsAndPolicyAnd = "and";
  static const String termsAndPolicy = "By continuing, you agree to our";

  // Sign Up - Personal Details
  static const String welcomeToAuctave = "Welcome to Auctave";
  static const String createAnAccountToGetStarted =
      "Create an account to get started.";

  static const String fullNameTextFieldLabel = "Full Name";
  static const String emailTextFieldLabel = "Email Address";
  static const String passwordTextFieldLabel = "Password";

  static const String fullNameTextFieldHint = "Enter your full name";
  static const String emailTextFieldHint = "Enter your email address";
  static const String passwordTextFieldHint = "***********";

  static const String createAccountButton = "Create Account";

  // Sign Up - Verify Phone Number
  static const String verifyPhoneNumber = "Verify phone number";
  static const String enterYourPhoneNumber =
      "Enter your phone number so we can send you a quick OTP and confirm it’s really you.";

  static const String phoneNumberTextFieldLabel = "Phone Number";
  static const String phoneNumberTextFieldHint = "Enter your phone number";

  static const String sendCodeButton = "Send Code";

  // Sign Up - Verify OTP
  static const String otpVerification = "OTP verification";
  static const String weJustSendCodeToPhoneNumber =
      "We just sent a 4-digit code to";
  static const String enterCodeToVerifyNumber =
      "Enter it here to verify your number and continue.";

  static const String didNotReceiveOTP = "Didn’t receive the OTP?";
  static const String resendOTPClickableText = "Resend OTP";

  static const String verifyButton = "Verify";

  // signUp Process Sucess
  static const String youAreIn = "You’re In! 🎉";
  static const String yourAuctaveAccountIsLive =
      "Your Auctave account’s live. Jump in and bid on something that catches your eye or list your first item.";

  static const String closeButton = "Close";
}

class AppTextStyles {
  TextStyle get _interFont => GoogleFonts.inter();

  // inter | 14
  TextStyle get kPBA12pxRegular => _interFont.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
  ); // regular

  // inter | 14
  TextStyle get kPBA14pxMedium => _interFont.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
  ); // medium

  TextStyle get kPBA14pxRegular => _interFont.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
  ); // regular

  // inter | 16
  TextStyle get kPBA16pxMedium => _interFont.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
  ); // medium
  TextStyle get kPBA16pxRegular => _interFont.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
  ); // regular

  // inter | 20
  TextStyle get kPBA20pxMedium => _interFont.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 20.0,
  ); // medium

  // inter | 24
  TextStyle get kPBA24pxBold =>
      _interFont.copyWith(fontWeight: FontWeight.w700, fontSize: 24.0); // bold
  TextStyle get kPBA24pxMedium => _interFont.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 24.0,
  ); // medium

  // inter | 24

  TextStyle get kPBA28pxMedium =>
      _interFont.copyWith(fontWeight: FontWeight.w500, fontSize: 28.0); // bold

  // inter | 32
  TextStyle get kPBA32pxMedium => _interFont.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 32.0,
  ); // medium
}
