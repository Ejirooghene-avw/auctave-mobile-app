import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AuctionProductScreen());
  }
}

// Splash Screen | Start

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC4F03B),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Center(child: SvgPicture.asset("assets/logos/app_logo.svg")),

            Positioned(
              bottom: 100.0,
              child: Row(
                children: List.generate(3, (index) {
                  return Container(
                    height: 12.0,
                    width: 12.0,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Splash Screen | End

// Onboarding Screen. | Start

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int currentSlideIndex = 0;

  bool shouldSkipBeVisible = true;

  List onboardingSlideDetails = [
    {
      "image": "assets/illustrations/onboarding_carousel_win_starts_here.svg",
      "title": "Your next win starts here.",
      "sub-title":
          "Bid in real time, compete fairly, and grab deals before the clock runs out.",
      "button-text": "Next",
    },

    {
      "image": "assets/illustrations/onboarding_carousel_bids_do_the_work.svg",
      "title": "Let the bids do the work.",
      "sub-title":
          "List your an item once and watch buyers raise the price for you.",
      "button-text": "Next",
    },

    {
      "image": "assets/illustrations/onboarding_carousel_win_safe_trades.svg",
      "title": "Safe trades, happy faces.",
      "sub-title":
          "Every payment sits in escrow until delivery, so no one loses out.",
      "button-text": "Sign Up",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 18.0),
              foregroundColor: Color(0xFFFFFFFF),
              backgroundColor: Color(0xFF000000),
            ),
            onPressed: () {
              bool isNextPageAvailable =
                  currentSlideIndex + 1 < onboardingSlideDetails.length;

              if (isNextPageAvailable == true) {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.linear,
                );
              } else {
                // TODO: implement sign Up button function
                print("Onboaring Complete : You may proceed to next page");
              }
            },
            child: Text(
              onboardingSlideDetails[currentSlideIndex]["button-text"],
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0).copyWith(top: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    [
                      currentSlideIndex + 1,
                      onboardingSlideDetails.length,
                    ].join("/"),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: Color(0xFF6C6C6C), //Text/Secondary
                    ),
                  ),
                  shouldSkipBeVisible == true
                      ? GestureDetector(
                          onTap: () {
                            // TODO: implement skip function
                          },
                          child: Text(
                            "Skip",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Color(0xFF000000), //PBA/Brand/Black
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
              SizedBox(height: 12.0),
              Row(
                children: List.generate(onboardingSlideDetails.length, (index) {
                  bool isCurrentSlideSameAsIndex = currentSlideIndex == index;
                  bool isCurrentSlideGreaterThanIndex =
                      (currentSlideIndex + 1 > index) &&
                      (currentSlideIndex != 0);

                  return Expanded(
                    child: Stack(
                      children: [
                        Container(
                          height: 6.0,
                          width: isCurrentSlideSameAsIndex == true
                              ? 8
                              : double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 2.0),
                          decoration: BoxDecoration(
                            color: isCurrentSlideGreaterThanIndex == true
                                ? Color(0xFFB2DA36)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                        Container(
                          height: 6,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 2.0),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              SizedBox(height: 68.0),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (newSlideIndex) {
                    setState(() {
                      currentSlideIndex = newSlideIndex;

                      // to check if we have reached the end of the slides
                      // if we have reached the end then skip button should not be visible
                      if (currentSlideIndex + 1 >=
                          onboardingSlideDetails.length) {
                        shouldSkipBeVisible = false;
                      }
                    });
                  },
                  children: onboardingSlideDetails.map((slideDetail) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(slideDetail["image"]),
                        SizedBox(height: 56.0),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.50,
                          child: Text(
                            slideDetail["title"],
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 32.0,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.52,
                          child: Text(
                            slideDetail["sub-title"],
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              color: Color(0xFF6B6B6B),
                            ),
                          ),
                        ),
                      ],
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

// Onboarding Screen. | End

// Sign In Screen | Start

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List signInButtons = [
      {
        "button-icon": "assets/icons/sign_in_with_email_button_icon.svg",
        "button-label": "Continue with Email",
        "on-pressed": () {
          //TODO: implement continue With email functionality
          print("email-button");
        },
      },
      {
        "button-icon": "assets/icons/sign_in_with_google_button_icon.svg",
        "button-label": "Continue with Google",
        "on-pressed": () {
          //TODO: implement continue With google functionality
          print("google-button");
        },
      },
      {
        "button-icon": "assets/icons/sign_in_with_apple_button_icon.svg",
        "button-label": "Continue with Apple",
        "on-pressed": () {
          //TODO: implement continue With apple functionality
          print("apple-button");
        },
      },
      {
        "button-icon": "assets/icons/sign_in_with_facebook_button_icon.svg",
        "button-label": "Continue with Facebook",
        "on-pressed": () {
          //TODO: implement continue With facebook functionality
          print("facebook-button");
        },
      },
    ];

    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Already have an account?",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  color: Color(0xFF6B6B6B),
                ),
              ),
              SizedBox(height: 12.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 18.0),
                    foregroundColor: Color(0xFFFFFFFF),
                    backgroundColor: Color(0xFF000000),
                  ),
                  onPressed: () {
                    // TODO: Implement Login Function
                  },
                  child: Text(
                    "Log in",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 46.5),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "By continuing, you agree to our",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      color: Color(0xFF6B6B6B),
                    ),
                    children: [
                      TextSpan(text: " "),
                      TextSpan(
                        text: "Terms And Service",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: Color(0xFF1A1A1A),
                          decoration: TextDecoration.underline,
                        ),
                      ),

                      TextSpan(text: " "),
                      TextSpan(
                        text: "and",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: Color(0xFF6B6B6B),
                        ),
                      ),
                      TextSpan(text: " "),
                      TextSpan(
                        text: "Privacy Policy",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: Color(0xFF1A1A1A),
                          decoration: TextDecoration.underline,
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0).copyWith(top: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/logos/sign_in_app_logo.svg"),
              SizedBox(height: 16.0),
              Text(
                "Sign up for Auctave",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 24.0,
                  color: Color(0xFF1A1A1A),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              for (var button in signInButtons)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 18.0),
                        foregroundColor: Color(0xFF000000),
                      ),
                      onPressed: button["on-pressed"],
                      icon: SvgPicture.asset(button["button-icon"]),
                      label: Text(
                        button["button-label"],
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Sign In Screen | End

// Sign up Screen | Start

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //TODO:Implement back function
          },
          icon: SvgPicture.asset("assets/icons/PBA_chevron.svg"),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 18.0),
                    foregroundColor: Color(0xFFFFFFFF),
                    backgroundColor: Color(0xFF000000),
                  ),
                  onPressed: () {
                    // Implement Create Account Function
                  },
                  child: Text(
                    "Create Account",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 46.5),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "By continuing, you agree to our",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      color: Color(0xFF6B6B6B),
                    ),
                    children: [
                      TextSpan(text: " "),
                      TextSpan(
                        text: "Terms And Service",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: Color(0xFF1A1A1A),
                          decoration: TextDecoration.underline,
                        ),
                      ),

                      TextSpan(text: " "),
                      TextSpan(
                        text: "and",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: Color(0xFF6B6B6B),
                        ),
                      ),
                      TextSpan(text: " "),
                      TextSpan(
                        text: "Privacy Policy",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: Color(0xFF1A1A1A),
                          decoration: TextDecoration.underline,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0).copyWith(top: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome To Auctave",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 24.0,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "Create an account to get started.",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.0,
                  color: Color(0xFF6B6B6B),
                ),
              ),

              SizedBox(height: 24.0),
              // fullName
              Text(
                "Full Name",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  color: Color(0xFF1E1E1E),
                ),
                cursorColor: Color(0xFF1E1E1E),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "Enter your full name",
                  hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Color(0xFFA5A5A5),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    gapPadding: 10.0,
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    gapPadding: 10.0,
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFF1E1E1E),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    gapPadding: 10.0,
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.0),
              // email
              Text(
                "Email Address",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  color: Color(0xFF1E1E1E),
                ),
                cursorColor: Color(0xFF1E1E1E),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Enter your email address",
                  hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Color(0xFFA5A5A5),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    gapPadding: 10.0,
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    gapPadding: 10.0,
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFF1E1E1E),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    gapPadding: 10.0,
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.0),
              // Password
              Text(
                "Password",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                obscureText: !isPasswordVisible,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  color: Color(0xFF1E1E1E),
                ),
                cursorColor: Color(0xFF1E1E1E),
                decoration: InputDecoration(
                  hintText: "***********",
                  hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Color(0xFFA5A5A5),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      isPasswordVisible == true
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Color(0xFFA5A5A5),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    gapPadding: 10.0,
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    gapPadding: 10.0,
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFF1E1E1E),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    gapPadding: 10.0,
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Sign Up Screen | End

// Verify Phone Number Screen | Start

class VerifyPhoneNumberScreen extends StatefulWidget {
  const VerifyPhoneNumberScreen({super.key});

  @override
  State<VerifyPhoneNumberScreen> createState() =>
      _VerifyPhoneNumberScreenState();
}

class _VerifyPhoneNumberScreenState extends State<VerifyPhoneNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //TODO:Implement back function
          },
          icon: SvgPicture.asset("assets/icons/PBA_chevron.svg"),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 18.0),
                    foregroundColor: Color(0xFFFFFFFF),
                    backgroundColor: Color(0xFF000000),
                  ),
                  onPressed: () {
                    // Implement Send Code Function
                  },
                  child: Text(
                    "Send Code",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 46.5),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "By continuing, you agree to our",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      color: Color(0xFF6B6B6B),
                    ),
                    children: [
                      TextSpan(text: " "),
                      TextSpan(
                        text: "Terms And Service",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: Color(0xFF1A1A1A),
                          decoration: TextDecoration.underline,
                        ),
                      ),

                      TextSpan(text: " "),
                      TextSpan(
                        text: "and",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: Color(0xFF6B6B6B),
                        ),
                      ),
                      TextSpan(text: " "),
                      TextSpan(
                        text: "Privacy Policy",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: Color(0xFF1A1A1A),
                          decoration: TextDecoration.underline,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0).copyWith(top: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Verify phone number",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 24.0,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "Enter your phone number so we can send you a quick OTP and confirm it’s really you.",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.0,
                  color: Color(0xFF6B6B6B),
                ),
              ),

              SizedBox(height: 24.0),
              // phone number
              Text(
                "Phone Number",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  color: Color(0xFF1E1E1E),
                ),
                cursorColor: Color(0xFF1E1E1E),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "Enter your phone number",
                  hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Color(0xFFA5A5A5),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    gapPadding: 10.0,
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    gapPadding: 10.0,
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFF1E1E1E),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    gapPadding: 10.0,
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Verify Phone Number Screen | End

// Verify Phone Number OTP Screen  | Start

class VerifyPhoneNumberOTPScreen extends StatefulWidget {
  const VerifyPhoneNumberOTPScreen({super.key});

  @override
  State<VerifyPhoneNumberOTPScreen> createState() =>
      _VerifyPhoneNumberOTPScreenState();
}

class _VerifyPhoneNumberOTPScreenState
    extends State<VerifyPhoneNumberOTPScreen> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(4, (_) => TextEditingController());
    focusNodes = List.generate(4, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.length == 1 && index < 4 - 1) {
      focusNodes[index + 1].requestFocus();
    }

    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }

    final otp = controllers.map((c) => c.text).join();
    if (otp.length == 4 && !otp.contains('')) {
      // Implement Completed Function
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //TODO:Implement back function
          },
          icon: SvgPicture.asset("assets/icons/PBA_chevron.svg"),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 18.0),
                    foregroundColor: Color(0xFFFFFFFF),
                    backgroundColor: Color(0xFF000000),
                  ),
                  onPressed: () {
                    // Implement Verify Function
                  },
                  child: Text(
                    "Verify",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 46.5),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "By continuing, you agree to our",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      color: Color(0xFF6B6B6B),
                    ),
                    children: [
                      TextSpan(text: " "),
                      TextSpan(
                        text: "Terms And Service",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: Color(0xFF1A1A1A),
                          decoration: TextDecoration.underline,
                        ),
                      ),

                      TextSpan(text: " "),
                      TextSpan(
                        text: "and",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: Color(0xFF6B6B6B),
                        ),
                      ),
                      TextSpan(text: " "),
                      TextSpan(
                        text: "Privacy Policy",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: Color(0xFF1A1A1A),
                          decoration: TextDecoration.underline,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0).copyWith(top: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "OTP verification",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 24.0,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 16.0),
              RichText(
                text: TextSpan(
                  text: "We just sent a 4-digit code to",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                    color: Color(0xFF6B6B6B),
                  ),
                  children: [
                    TextSpan(text: " "),
                    TextSpan(
                      text: "+234 9126454646.",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    TextSpan(text: "\n"),
                    TextSpan(
                      text: "Enter it here to verify your number and continue.",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0,
                        color: Color(0xFF6B6B6B),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.0),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.5),
                child: Row(
                  children: List.generate(4, (index) {
                    return Expanded(
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          maxLength: 1,
                          controller: controllers[index],
                          focusNode: focusNodes[index],
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 28.0,
                            color: Color(0xFF1E1E1E),
                          ),
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: Color(0xFF1E1E1E),
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            counter: SizedBox.shrink(),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 9.5,
                              vertical: 10.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              gapPadding: 10.0,
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Color(0xFFE5E5E5),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              gapPadding: 10.0,
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Color(0xFF1E1E1E),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              gapPadding: 10.0,
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Color(0xFFE5E5E5),
                              ),
                            ),
                          ),
                          onChanged: (value) => _onChanged(value, index),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              SizedBox(height: 24.0),

              Align(
                alignment: Alignment.center,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Didn’t receive the OTP?",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      color: Color(0xFF6B6B6B),
                    ),
                    children: [
                      TextSpan(text: " "),
                      TextSpan(
                        text: "Resend OTP",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                          color: Color(0xFF000000),
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
    );
  }
}

// Verify Phone Number OTP Screen | End

// Log in Screen | Start

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //TODO:Implement back function
          },
          icon: SvgPicture.asset("assets/icons/PBA_chevron.svg"),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0).copyWith(top: 40.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 24.0,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Log in to keep bidding, listing, and winning on Auctave.",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                    color: Color(0xFF6B6B6B),
                  ),
                ),
                SizedBox(height: 32.0),
                // email
                Text(
                  "Email Address",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Color(0xFF1E1E1E),
                  ),
                  cursorColor: Color(0xFF1E1E1E),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter your email address",
                    hintStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                      color: Color(0xFFA5A5A5),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      gapPadding: 10.0,
                      borderSide: BorderSide(
                        width: 1.0,
                        color: Color(0xFFE5E5E5),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      gapPadding: 10.0,
                      borderSide: BorderSide(
                        width: 1.0,
                        color: Color(0xFF1E1E1E),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      gapPadding: 10.0,
                      borderSide: BorderSide(
                        width: 1.0,
                        color: Color(0xFFE5E5E5),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16.0),
                // Password
                Text(
                  "Password",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  obscureText: !isPasswordVisible,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Color(0xFF1E1E1E),
                  ),
                  cursorColor: Color(0xFF1E1E1E),
                  decoration: InputDecoration(
                    hintText: "***********",
                    hintStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                      color: Color(0xFFA5A5A5),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        isPasswordVisible == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Color(0xFFA5A5A5),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      gapPadding: 10.0,
                      borderSide: BorderSide(
                        width: 1.0,
                        color: Color(0xFFE5E5E5),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      gapPadding: 10.0,
                      borderSide: BorderSide(
                        width: 1.0,
                        color: Color(0xFF1E1E1E),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      gapPadding: 10.0,
                      borderSide: BorderSide(
                        width: 1.0,
                        color: Color(0xFFE5E5E5),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: Color(0xFFB2DA36),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 40.0),

                // loginButton
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 18.0),
                      foregroundColor: Color(0xFFFFFFFF),
                      backgroundColor: Color(0xFF000000),
                    ),
                    onPressed: () {
                      // Implement Verify Function
                    },
                    child: Text(
                      "Log In",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 12.0),

                // dontHaveAnAccount
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Don’t have an account?",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: Color(0xFF6B6B6B),
                      ),
                      children: [
                        TextSpan(text: " "),
                        TextSpan(
                          text: "Sign Up",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 72.0),

                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "or continue with",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      color: Color(0xFF6B6B6B),
                    ),
                  ),
                ),

                SizedBox(height: 16.0),

                Row(
                  children:
                      [
                        "assets/icons/sign_in_with_google_button_icon.svg",
                        "assets/icons/sign_in_with_apple_button_icon.svg",
                        "assets/icons/sign_in_with_facebook_button_icon.svg",
                      ].map((iconPath) {
                        return Expanded(
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 8.0),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                              ),
                              onPressed: () {},
                              child: SvgPicture.asset(iconPath),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Log in Screen | End

// Reset Password Screen | Start

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //TODO:Implement back function
          },
          icon: SvgPicture.asset("assets/icons/PBA_chevron.svg"),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 18.0),
                foregroundColor: Color(0xFFFFFFFF),
                backgroundColor: Color(0xFF000000),
              ),
              onPressed: () {
                // Implement Send Code Function
              },
              child: Text(
                "Send Code",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0).copyWith(top: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forgot your password?",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 24.0,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "No stress. Enter your email and we’ll send you a one-time code to reset it.",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.0,
                  color: Color(0xFF6B6B6B),
                ),
              ),

              SizedBox(height: 24.0),
              // email
              Text(
                "Email Address",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  color: Color(0xFF1E1E1E),
                ),
                cursorColor: Color(0xFF1E1E1E),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Enter your email address",
                  hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Color(0xFFA5A5A5),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    gapPadding: 10.0,
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    gapPadding: 10.0,
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFF1E1E1E),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    gapPadding: 10.0,
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Reset Password Screen | End

// Verify Email  OTP Screen  | Start

class VerifyEmailOTPScreen extends StatefulWidget {
  const VerifyEmailOTPScreen({super.key});

  @override
  State<VerifyEmailOTPScreen> createState() => _VerifyEmailOTPScreenState();
}

class _VerifyEmailOTPScreenState extends State<VerifyEmailOTPScreen> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(4, (_) => TextEditingController());
    focusNodes = List.generate(4, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.length == 1 && index < 4 - 1) {
      focusNodes[index + 1].requestFocus();
    }

    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }

    final otp = controllers.map((c) => c.text).join();
    if (otp.length == 4 && !otp.contains('')) {
      // Implement Completed Function
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //TODO:Implement back function
          },
          icon: SvgPicture.asset("assets/icons/PBA_chevron.svg"),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 18.0),
                    foregroundColor: Color(0xFFFFFFFF),
                    backgroundColor: Color(0xFF000000),
                  ),
                  onPressed: () {
                    // Implement Verify Function
                  },
                  child: Text(
                    "Verify",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 46.5),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "By continuing, you agree to our",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      color: Color(0xFF6B6B6B),
                    ),
                    children: [
                      TextSpan(text: " "),
                      TextSpan(
                        text: "Terms And Service",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: Color(0xFF1A1A1A),
                          decoration: TextDecoration.underline,
                        ),
                      ),

                      TextSpan(text: " "),
                      TextSpan(
                        text: "and",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: Color(0xFF6B6B6B),
                        ),
                      ),
                      TextSpan(text: " "),
                      TextSpan(
                        text: "Privacy Policy",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: Color(0xFF1A1A1A),
                          decoration: TextDecoration.underline,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0).copyWith(top: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter your code",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 24.0,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 16.0),
              RichText(
                text: TextSpan(
                  text: "We just sent a 4-digit code to",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                    color: Color(0xFF6B6B6B),
                  ),
                  children: [
                    TextSpan(text: " "),
                    TextSpan(
                      text: "ambrose@gmail.com.",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    TextSpan(text: "\n"),
                    TextSpan(
                      text: "Type it in here to confirm and move on.",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0,
                        color: Color(0xFF6B6B6B),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.0),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.5),
                child: Row(
                  children: List.generate(4, (index) {
                    return Expanded(
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          maxLength: 1,
                          controller: controllers[index],
                          focusNode: focusNodes[index],
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 28.0,
                            color: Color(0xFF1E1E1E),
                          ),
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: Color(0xFF1E1E1E),
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            counter: SizedBox.shrink(),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 9.5,
                              vertical: 10.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              gapPadding: 10.0,
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Color(0xFFE5E5E5),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              gapPadding: 10.0,
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Color(0xFF1E1E1E),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              gapPadding: 10.0,
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Color(0xFFE5E5E5),
                              ),
                            ),
                          ),
                          onChanged: (value) => _onChanged(value, index),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              SizedBox(height: 24.0),

              Align(
                alignment: Alignment.center,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Didn’t receive the OTP?",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      color: Color(0xFF6B6B6B),
                    ),
                    children: [
                      TextSpan(text: " "),
                      TextSpan(
                        text: "Resend OTP",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                          color: Color(0xFF000000),
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
    );
  }
}

// Verify Email OTP Screen | End

// New Password Screen. | Start

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool isNewPasswordVisible = false;
  bool isConfirmNewPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //TODO:Implement back function
          },
          icon: SvgPicture.asset("assets/icons/PBA_chevron.svg"),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 18.0),
                foregroundColor: Color(0xFFFFFFFF),
                backgroundColor: Color(0xFF000000),
              ),
              onPressed: () {
                // Implement Reset Password Function
              },
              child: Text(
                "Reset Password",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0).copyWith(top: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Set a new password",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 24.0,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "Create a fresh password you will remember. Enter it twice to confirm.",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.0,
                  color: Color(0xFF6B6B6B),
                ),
              ),

              SizedBox(height: 24.0),
              // New Password
              Text(
                "New Password",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                obscureText: !isNewPasswordVisible,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  color: Color(0xFF1E1E1E),
                ),
                cursorColor: Color(0xFF1E1E1E),
                decoration: InputDecoration(
                  hintText: "***********",
                  hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Color(0xFFA5A5A5),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isNewPasswordVisible = !isNewPasswordVisible;
                      });
                    },
                    icon: Icon(
                      isNewPasswordVisible == true
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Color(0xFFA5A5A5),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    gapPadding: 10.0,
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    gapPadding: 10.0,
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFF1E1E1E),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    gapPadding: 10.0,
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.0),

              // Confirm New Password
              Text(
                "Confirm New Password",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                obscureText: !isConfirmNewPasswordVisible,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  color: Color(0xFF1E1E1E),
                ),
                cursorColor: Color(0xFF1E1E1E),
                decoration: InputDecoration(
                  hintText: "***********",
                  hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Color(0xFFA5A5A5),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isConfirmNewPasswordVisible =
                            !isConfirmNewPasswordVisible;
                      });
                    },
                    icon: Icon(
                      isConfirmNewPasswordVisible == true
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Color(0xFFA5A5A5),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    gapPadding: 10.0,
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    gapPadding: 10.0,
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFF1E1E1E),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    gapPadding: 10.0,
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// New Password Screen. | End

// Home Screen | Start

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  // TODO:UPDATE PAGE STATE ACCORDING TO DATA
  // TODO" IMPLEMENT TAB OPTION

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List featuredAuctionProducts = [
    {
      "product-image": "assets/dummy/dummy_feature_auction_1.png",
      "product-title": "Solid Oak Classic Dining Chair",
      "current-bid": 60400,
      "time-left-in-seconds": 10,
      "is-product-live": true,
    },
    {
      "product-image": "assets/dummy/dummy_feature_auction_2.png",
      "product-title":
          "Official UEFA Champions League 2015/2016 Final Matchball",
      "current-bid": 1500000,
      "time-left-in-seconds": 10,
      "is-product-live": true,
    },
  ];

  List tabOptions = ["All", "Live", "Upcoming", "Saved"];

  int currentTabOptionIndex = 0;

  List homeScreeAuctionProducts = [
    {
      "product-id": 934,
      "product-image": "assets/dummy/dummy_auction_product_card_image_1.png",
      "product-title": "Rolex Submariner Date Stainless Steel",
      "current-bid": 600400,
      "time-left-in-seconds": 10,
      "is-product-live": true,
      "starting-bid": 60000,
      "starts-in-time-in-seconds": 40000,
    },
    {
      "product-id": 134,
      "product-image": "assets/dummy/dummy_auction_product_card_image_2.png",
      "product-title": "5-Bedroom Duplex with Rooftop Lounge",
      "current-bid": 0,
      "time-left-in-seconds": 84720,
      "is-product-live": false,
      "starting-bid": 3500000,
      "starts-in-time-in-seconds": 84720,
    },
    {
      "product-id": 232,
      "product-image": "assets/dummy/dummy_auction_product_card_image_3.png",
      "product-title": "Lamborghini Aventador LP 780-4 Ultimate",
      "current-bid": 0,
      "time-left-in-seconds": 84720,
      "is-product-live": false,
      "starting-bid": 8500000,
      "starts-in-time-in-seconds": 84720,
    },
    {
      "product-id": 298,
      "product-image": "assets/dummy/dummy_auction_product_card_image_4.png",
      "product-title": "Solid Oak Classic Dining Chair",
      "current-bid": 0,
      "time-left-in-seconds": 84720,
      "is-product-live": false,
      "starting-bid": 60400,
      "starts-in-time-in-seconds": 84720,
    },

    {
      "product-id": 124,
      "product-image": "assets/dummy/dummy_auction_product_card_image_5.png",
      "product-title": "Men’s Checkered Button-Up Shirt",
      "current-bid": 400250,
      "time-left-in-seconds": 4,
      "is-product-live": true,
      "starting-bid": 60400,
      "starts-in-time-in-seconds": 84720,
    },

    {
      "product-id": 234,
      "product-image": "assets/dummy/dummy_auction_product_card_image_6.png",
      "product-title": "Reebok Classic Leather Retro",
      "current-bid": 0,
      "time-left-in-seconds": 84720,
      "is-product-live": false,
      "starting-bid": 150200,
      "starts-in-time-in-seconds": 84720,
    },
  ];

  late List<Map<String, dynamic>> allAuctionProducts;
  late List<Map<String, dynamic>> filteredAuctionProducts;

  List<int> savedProducts = [234, 124];

  @override
  void initState() {
    super.initState();
    allAuctionProducts = List.from(homeScreeAuctionProducts);
    filteredAuctionProducts = List.from(homeScreeAuctionProducts);
  }

  String formatNaira(int amount) {
    if (amount >= 1_000_000) {
      final value = amount / 1_000_000;

      final formatted = value % 1 == 0
          ? value.toInt().toString()
          : value.toStringAsFixed(1);

      return '₦${formatted}m';
    }

    final formatter = NumberFormat('#,##0', 'en_US');
    return '₦${formatter.format(amount)}';
  }

  String formatDuration(int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    }

    if (minutes > 0) {
      return '${minutes}m';
    }

    return '${seconds}s';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipOval(
                          child: SizedBox(
                            height: 40.0,
                            width: 40.0,
                            child: Image.asset(
                              "assets/dummy/dummy_profile_image.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.0),

                        Text(
                          "Hey Japheth 👋",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ],
                    ),

                    SvgPicture.asset("assets/icons/notification_icon.svg"),
                  ],
                ),

                SizedBox(height: 16.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40.0,
                        child: TextField(
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0,
                            color: Color(0xFF1E1E1E),
                          ),
                          cursorColor: Color(0xFF1E1E1E),
                          keyboardType: TextInputType.webSearch,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0,
                              ).copyWith(right: 10.0),
                              child: SvgPicture.asset(
                                "assets/icons/PBA_search_icon.svg",
                              ),
                            ),
                            hintText: "Search auctions or items...",
                            hintStyle: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.0,
                              color: Color(0xFFA5A5A5),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 7.5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              gapPadding: 10.0,
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Color(0xFFE5E5E5),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              gapPadding: 10.0,
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Color(0xFF1E1E1E),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              gapPadding: 10.0,
                              borderSide: BorderSide(
                                width: 1.0,
                                color: Color(0xFFE5E5E5),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.0),

                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset("assets/icons/filter_icon.svg"),
                    ),
                  ],
                ),

                SizedBox(height: 24.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Featured Auctions",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "View all",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                          color: Color(0xFFB2DA36),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: featuredAuctionProducts.map((auctionProduct) {
                      return Container(
                        width: 260.0,
                        margin: EdgeInsets.only(right: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 142.0,
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.0,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(6.0),
                                image: DecorationImage(
                                  image: AssetImage(
                                    auctionProduct["product-image"],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 6.0,
                                      horizontal: 8.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFDC2626),
                                      borderRadius: BorderRadius.circular(
                                        100.0,
                                      ),
                                    ),
                                    child: Text(
                                      "LIVE",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.0,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                  ),

                                  SvgPicture.asset(
                                    "assets/icons/PBA_option.svg",
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              auctionProduct["product-title"],
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 15.0,
                                color: Color(0xFF1A1A1A),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      formatNaira(
                                        auctionProduct["current-bid"],
                                      ),
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.0,
                                        color: Color(0xFF2D5DDC),
                                      ),
                                    ),
                                    SizedBox(height: 4.5),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/PBA_tag.svg",
                                        ),
                                        SizedBox(width: 4.0),
                                        Text(
                                          "Current bid",
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.0,
                                            color: Color(0xFF6B6B6B),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/PBA_clock.svg",
                                    ),
                                    Text(
                                      formatDuration(
                                        auctionProduct["time-left-in-seconds"],
                                      ),
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0,
                                        color: Color(0xFFDC2626),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),

                SizedBox(height: 32.0),

                Row(
                  children: tabOptions.map((buttonLabel) {
                    int indexOfTabOption = tabOptions.indexOf(buttonLabel);
                    bool isTabOptionSelected =
                        indexOfTabOption == currentTabOptionIndex;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentTabOptionIndex = indexOfTabOption;
                        });

                        switch (indexOfTabOption) {
                          case 1:
                            setState(() {
                              filteredAuctionProducts = allAuctionProducts
                                  .where(
                                    (product) =>
                                        product["is-product-live"] == true,
                                  )
                                  .toList();
                            });
                            break;
                          case 2:
                            setState(() {
                              filteredAuctionProducts = allAuctionProducts
                                  .where(
                                    (product) =>
                                        product["is-product-live"] == false,
                                  )
                                  .toList();
                            });
                            break;
                          case 3:
                            setState(() {
                              filteredAuctionProducts = allAuctionProducts
                                  .where(
                                    (product) => savedProducts.contains(
                                      product["product-id"],
                                    ),
                                  )
                                  .toList();
                            });
                            break;
                          default:
                            setState(() {
                              filteredAuctionProducts = List.from(
                                allAuctionProducts,
                              );
                            });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        margin: EdgeInsets.only(right: 12.0),

                        decoration: BoxDecoration(
                          color: isTabOptionSelected == true
                              ? Color(0xFF000000)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(100.0),
                          border: Border.all(
                            color: isTabOptionSelected == true
                                ? Color(0xFF000000)
                                : Color(0xFFA5A5A5),
                            width: 1.0,
                          ),
                        ),
                        child: Text(
                          buttonLabel,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0,
                            color: isTabOptionSelected == true
                                ? Color(0xFFFFFFFF)
                                : Color(0xFFA5A5A5),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                SizedBox(height: 16.0),

                GridView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.0,
                    childAspectRatio: 0.74,
                  ),
                  children: filteredAuctionProducts.map((auctionProduct) {
                    bool isProductLive = auctionProduct["is-product-live"];
                    int productPrice = isProductLive == true
                        ? auctionProduct["current-bid"]
                        : auctionProduct["starting-bid"];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 142.0,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(6.0),
                            image: DecorationImage(
                              image: AssetImage(
                                auctionProduct["product-image"],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              isProductLive == true
                                  ? Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 6.0,
                                        horizontal: 8.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFDC2626),
                                        borderRadius: BorderRadius.circular(
                                          100.0,
                                        ),
                                      ),
                                      child: Text(
                                        "LIVE",
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.0,
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    )
                                  : SizedBox.shrink(),

                              SvgPicture.asset("assets/icons/PBA_option.svg"),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          auctionProduct["product-title"],
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  formatNaira(productPrice),
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.0,
                                    color: Color(0xFF2D5DDC),
                                  ),
                                ),
                                SizedBox(height: 4.5),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/PBA_tag.svg",
                                    ),
                                    SizedBox(width: 4.0),
                                    Text(
                                      isProductLive == true
                                          ? "Current bid"
                                          : "Opening bid",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.0,
                                        color: Color(0xFF6B6B6B),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            isProductLive == true
                                ? Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/PBA_clock.svg",
                                      ),
                                      Text(
                                        formatDuration(
                                          auctionProduct["time-left-in-seconds"],
                                        ),
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0,
                                          color: Color(0xFFDC2626),
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Starts in",
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10.0,
                                          color: Color(0xFF6B6B6B),
                                        ),
                                      ),
                                      Text(
                                        formatDuration(
                                          auctionProduct["starts-in-time-in-seconds"],
                                        ),
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.0,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Home Screen | End

// Filter Categories Screen | Start

class FilterCategoriesScreen extends StatelessWidget {
  const FilterCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List filterCategoriesButtons = [
      {
        "button-label": "Art",
        "button-icon": "assets/icons/filter_categories_icons/art.svg",
      },
      {
        "button-label": "Beauty & Personal Care",
        "button-icon": "assets/icons/filter_categories_icons/beauty.svg",
      },
      {
        "button-label": "Books & Antiques",
        "button-icon": "assets/icons/filter_categories_icons/book.svg",
      },
      {
        "button-label": "Collectibles",
        "button-icon": "assets/icons/filter_categories_icons/collectibles.svg",
      },
      {
        "button-label": "Digital Assets",
        "button-icon":
            "assets/icons/filter_categories_icons/digital_assets.svg",
      },
      {
        "button-label": "Electronics",
        "button-icon": "assets/icons/filter_categories_icons/electronics.svg",
      },
      {
        "button-label": "Fashion",
        "button-icon": "assets/icons/filter_categories_icons/fashion.svg",
      },
      {
        "button-label": "Food & Drinks",
        "button-icon":
            "assets/icons/filter_categories_icons/food_and_drinks.svg",
      },
      {
        "button-label": "Furniture",
        "button-icon": "assets/icons/filter_categories_icons/furniture.svg",
      },
      {
        "button-label": "Gaming & Toys",
        "button-icon": "assets/icons/filter_categories_icons/gaming.svg",
      },
      {
        "button-label": "Home Decor",
        "button-icon": "assets/icons/filter_categories_icons/home_decor.svg",
      },
      {
        "button-label": "Jewelry",
        "button-icon": "assets/icons/filter_categories_icons/jewelry.svg",
      },
      {
        "button-label": "Luxury & Rare Items",
        "button-icon": "assets/icons/filter_categories_icons/luxury.svg",
      },
      {
        "button-label": "Music & Instruments",
        "button-icon": "assets/icons/filter_categories_icons/music.svg",
      },
      {
        "button-label": "Real Estate",
        "button-icon": "assets/icons/filter_categories_icons/real_estate.svg",
      },
      {
        "button-label": "Sports",
        "button-icon": "assets/icons/filter_categories_icons/sports.svg",
      },
      {
        "button-label": "Tools & Equipment",
        "button-icon": "assets/icons/filter_categories_icons/equipment.svg",
      },
      {
        "button-label": "Vehicles",
        "button-icon": "assets/icons/filter_categories_icons/car.svg",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //TODO:Implement back function
          },
          icon: SvgPicture.asset("assets/icons/PBA_chevron.svg"),
        ),
        title: Text(
          "Filter Categories",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
            color: Color(0xFF1A1A1A),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16.0,
            ),

            children: filterCategoriesButtons.map((categoryButton) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(categoryButton["button-icon"]),
                  SizedBox(height: 12.0),
                  Text(
                    categoryButton["button-label"],
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

// Filer Categories Screen | End

// Filter Categories Products Screen | Start

class FilterCategoriesProductsScreen extends StatefulWidget {
  const FilterCategoriesProductsScreen({super.key});

  @override
  State<FilterCategoriesProductsScreen> createState() =>
      _FilterCategoriesProductsScreenState();
}

class _FilterCategoriesProductsScreenState
    extends State<FilterCategoriesProductsScreen> {
  List tabOptions = ["All", "Live", "Upcoming", "Saved"];

  int currentTabOptionIndex = 0;

  List homeScreeAuctionProducts = [
    {
      "product-id": 934,
      "product-image": "assets/dummy/dummy_auction_product_card_image_1.png",
      "product-title": "Rolex Submariner Date Stainless Steel",
      "current-bid": 600400,
      "time-left-in-seconds": 10,
      "is-product-live": true,
      "starting-bid": 60000,
      "starts-in-time-in-seconds": 40000,
    },
    {
      "product-id": 134,
      "product-image": "assets/dummy/dummy_auction_product_card_image_2.png",
      "product-title": "5-Bedroom Duplex with Rooftop Lounge",
      "current-bid": 0,
      "time-left-in-seconds": 84720,
      "is-product-live": false,
      "starting-bid": 3500000,
      "starts-in-time-in-seconds": 84720,
    },
    {
      "product-id": 232,
      "product-image": "assets/dummy/dummy_auction_product_card_image_3.png",
      "product-title": "Lamborghini Aventador LP 780-4 Ultimate",
      "current-bid": 0,
      "time-left-in-seconds": 84720,
      "is-product-live": false,
      "starting-bid": 8500000,
      "starts-in-time-in-seconds": 84720,
    },
    {
      "product-id": 298,
      "product-image": "assets/dummy/dummy_auction_product_card_image_4.png",
      "product-title": "Solid Oak Classic Dining Chair",
      "current-bid": 0,
      "time-left-in-seconds": 84720,
      "is-product-live": false,
      "starting-bid": 60400,
      "starts-in-time-in-seconds": 84720,
    },

    {
      "product-id": 124,
      "product-image": "assets/dummy/dummy_auction_product_card_image_5.png",
      "product-title": "Men’s Checkered Button-Up Shirt",
      "current-bid": 400250,
      "time-left-in-seconds": 4,
      "is-product-live": true,
      "starting-bid": 60400,
      "starts-in-time-in-seconds": 84720,
    },

    {
      "product-id": 234,
      "product-image": "assets/dummy/dummy_auction_product_card_image_6.png",
      "product-title": "Reebok Classic Leather Retro",
      "current-bid": 0,
      "time-left-in-seconds": 84720,
      "is-product-live": false,
      "starting-bid": 150200,
      "starts-in-time-in-seconds": 84720,
    },
  ];

  late List<Map<String, dynamic>> allAuctionProducts;
  late List<Map<String, dynamic>> filteredAuctionProducts;

  List<int> savedProducts = [234, 124];

  String formatNaira(int amount) {
    if (amount >= 1_000_000) {
      final value = amount / 1_000_000;

      final formatted = value % 1 == 0
          ? value.toInt().toString()
          : value.toStringAsFixed(1);

      return '₦${formatted}m';
    }

    final formatter = NumberFormat('#,##0', 'en_US');
    return '₦${formatter.format(amount)}';
  }

  String formatDuration(int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    }

    if (minutes > 0) {
      return '${minutes}m';
    }

    return '${seconds}s';
  }

  @override
  void initState() {
    super.initState();
    allAuctionProducts = List.from(homeScreeAuctionProducts);
    filteredAuctionProducts = List.from(homeScreeAuctionProducts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        scrolledUnderElevation:
            0.0, // Fix the color that shows up under the app bar when the user scrolls
        leading: IconButton(
          onPressed: () {
            //TODO:Implement back function
          },
          icon: SvgPicture.asset("assets/icons/PBA_chevron.svg"),
        ),
        title: Text(
          "Beauty & Personal Care",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
            color: Color(0xFF1A1A1A),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: tabOptions.map((buttonLabel) {
                  int indexOfTabOption = tabOptions.indexOf(buttonLabel);
                  bool isTabOptionSelected =
                      indexOfTabOption == currentTabOptionIndex;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentTabOptionIndex = indexOfTabOption;
                      });

                      switch (indexOfTabOption) {
                        case 1:
                          setState(() {
                            filteredAuctionProducts = allAuctionProducts
                                .where(
                                  (product) =>
                                      product["is-product-live"] == true,
                                )
                                .toList();
                          });
                          break;
                        case 2:
                          setState(() {
                            filteredAuctionProducts = allAuctionProducts
                                .where(
                                  (product) =>
                                      product["is-product-live"] == false,
                                )
                                .toList();
                          });
                          break;
                        case 3:
                          setState(() {
                            filteredAuctionProducts = allAuctionProducts
                                .where(
                                  (product) => savedProducts.contains(
                                    product["product-id"],
                                  ),
                                )
                                .toList();
                          });
                          break;
                        default:
                          setState(() {
                            filteredAuctionProducts = List.from(
                              allAuctionProducts,
                            );
                          });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      margin: EdgeInsets.only(right: 12.0),

                      decoration: BoxDecoration(
                        color: isTabOptionSelected == true
                            ? Color(0xFF000000)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(
                          color: isTabOptionSelected == true
                              ? Color(0xFF000000)
                              : Color(0xFFA5A5A5),
                          width: 1.0,
                        ),
                      ),
                      child: Text(
                        buttonLabel,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0,
                          color: isTabOptionSelected == true
                              ? Color(0xFFFFFFFF)
                              : Color(0xFFA5A5A5),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              SizedBox(height: 16.0),

              Expanded(
                child: GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.0,
                    childAspectRatio: 0.74,
                  ),
                  children: filteredAuctionProducts.map((auctionProduct) {
                    bool isProductLive = auctionProduct["is-product-live"];
                    int productPrice = isProductLive == true
                        ? auctionProduct["current-bid"]
                        : auctionProduct["starting-bid"];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 142.0,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(6.0),
                            image: DecorationImage(
                              image: AssetImage(
                                auctionProduct["product-image"],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              isProductLive == true
                                  ? Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 6.0,
                                        horizontal: 8.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFDC2626),
                                        borderRadius: BorderRadius.circular(
                                          100.0,
                                        ),
                                      ),
                                      child: Text(
                                        "LIVE",
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.0,
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    )
                                  : SizedBox.shrink(),

                              SvgPicture.asset("assets/icons/PBA_option.svg"),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          auctionProduct["product-title"],
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  formatNaira(productPrice),
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.0,
                                    color: Color(0xFF2D5DDC),
                                  ),
                                ),
                                SizedBox(height: 4.5),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/PBA_tag.svg",
                                    ),
                                    SizedBox(width: 4.0),
                                    Text(
                                      isProductLive == true
                                          ? "Current bid"
                                          : "Opening bid",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.0,
                                        color: Color(0xFF6B6B6B),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            isProductLive == true
                                ? Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/PBA_clock.svg",
                                      ),
                                      Text(
                                        formatDuration(
                                          auctionProduct["time-left-in-seconds"],
                                        ),
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0,
                                          color: Color(0xFFDC2626),
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Starts in",
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10.0,
                                          color: Color(0xFF6B6B6B),
                                        ),
                                      ),
                                      Text(
                                        formatDuration(
                                          auctionProduct["starts-in-time-in-seconds"],
                                        ),
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.0,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ],
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

// Filer Categories Products Screen | End

// Auction Product Screen | Start

class AuctionProductScreen extends StatelessWidget {
  const AuctionProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

// Auction Product Screen | End
