import 'package:auctave_mobile_app/config/providers/app_providers.dart';
import 'package:auctave_mobile_app/routing/app_routes.dart';
import 'package:auctave_mobile_app/ui/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: AppProviders.providers, child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Auctave App",
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: AppTheme.mainAppTheme,
    );
  }
}

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

class AuctionProductScreen extends StatefulWidget {
  const AuctionProductScreen({super.key});

  @override
  State<AuctionProductScreen> createState() => _AuctionProductScreenState();
}

class _AuctionProductScreenState extends State<AuctionProductScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 6.0,
          ).copyWith(right: 8.0),
          child: SvgPicture.asset("assets/icons/product_details_back_icon.svg"),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SvgPicture.asset(
              "assets/icons/product_details_save_icon.svg",
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // TODO: use pageView so we can work with multiple pictures
              height: 289.0,
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 12.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: AssetImage(
                    "assets/dummy/dummy_product_details_image.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Container(
                    height: 8.0,
                    width: (index == 0) ? 20.0 : 8.0,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Color(0xFFEEEEEE),
                    ),
                  );
                }),
              ),
            ),

            SizedBox(height: 16.0),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 6.0,
                        ),
                        decoration: BoxDecoration(
                          border: BoxBorder.all(color: Color(0xFF6B6B6B)),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Text(
                          "Real Estate",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                            color: Color(0xFF6B6B6B),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/PBA_location.svg"),
                          SizedBox(width: 4.0),
                          Text(
                            "Ibadan, Oyo State.",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Color(0xFF6B6B6B),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "5-Bedroom Duplex with Rooftop Lounge",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 24.0,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Container(
                        height: 24.0,
                        width: 24.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/dummy/dummy_product_details_profile_picture.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        "by OkoliKong",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                          color: Color(0xFF6B6B6B),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formatNaira(3500000),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              fontSize: 28,
                              color: Color(0xFF2D5DDC),
                            ),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/PBA_tag.svg"),
                              SizedBox(width: 4.0),
                              Text(
                                "Opening Bid",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                  color: Color(0xFF6B6B6B),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                            "23h 22m",
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
              ),
            ),
            SizedBox(height: 32.0),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/PBA_box.svg"),
                          SizedBox(width: 8.0),
                          Text(
                            "Description",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        "Product Details",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                          color: Color(0xFF6B6B6B),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        "Crafted from 100% solid oak, this Classic Dining Chair brings lasting quality and simple elegance to your space. The chair’s natural grain is preserved with a smooth matte finish that resists scratches and stains while maintaining a warm, organic look. Its straight backrest offers firm ergonomic support, and the slightly contoured seat ensures comfort for long meals or work sessions.",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0,
                          color: Color(0xFF6B6B6B),
                        ),
                      ),
                      SizedBox(height: 4.0),
                      GestureDetector(
                        onTap: () {
                          // Show more details
                        },
                        child: Row(
                          children: [
                            Text(
                              "Read More",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                                color: Color(0xFF8BAA2A),
                              ),
                            ),
                            SizedBox(width: 2.0),

                            SvgPicture.asset(
                              "assets/icons/PBA_chevron_down.svg",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Auction Product Screen | End

// My Bids Screen | Start

class MyBidsScreen extends StatefulWidget {
  const MyBidsScreen({super.key});

  @override
  State<MyBidsScreen> createState() => _MyBidsScreenState();
}

class _MyBidsScreenState extends State<MyBidsScreen>
    with SingleTickerProviderStateMixin {
  List myBidsScreenTabs = [
    {
      "tab-label": "Active",
      "tab-icon": "assets/icons/my_bids/my_bids_active_tab_tag_icon.svg",
    },
    {
      "tab-label": "Won",
      "tab-icon": "assets/icons/my_bids/my_bids_wins_tab_trophy_icon.svg",
    },
    {
      "tab-label": "Loss",
      "tab-icon": "assets/icons/my_bids/my_bids_lost_tab_loss_icon.svg",
    },
  ];

  List activeAuctionBids = [
    {
      "product-image": "assets/dummy/dummy_my_bids_product_image.png",
      "product-title": "Rolex Submariner Date Stainless Steel",
      "current-bid": 600400,
      "time-left-in-seconds": 40,
      "bid-position":
          1, // This simulates that amongst the bid places this is the position of your bid relative to amount | will be calulated in backend on may on app
    },
    {
      "product-image": "assets/dummy/dummy_my_bids_product_image.png",
      "product-title": "Rolex Submariner Date Stainless Steel",
      "current-bid": 600400,
      "time-left-in-seconds": 40,
      "bid-position":
          2, // This simulates that amongst the bid places this is the position of your bid relative to amount | will be calulated in backend on may on app
    },
    {
      "product-image": "assets/dummy/dummy_my_bids_product_image.png",
      "product-title": "Rolex Submariner Date Stainless Steel",
      "current-bid": 600400,
      "time-left-in-seconds": 40,
      "bid-position":
          3, // This simulates that amongst the bid places this is the position of your bid relative to amount | will be calulated in backend on may on app
    },
    {
      "product-image": "assets/dummy/dummy_my_bids_product_image.png",
      "product-title": "Rolex Submariner Date Stainless Steel",
      "current-bid": 600400,
      "time-left-in-seconds": 40,
      "bid-position":
          4, // This simulates that amongst the bid places this is the position of your bid relative to amount | will be calulated in backend on may on app
    },
    {
      "product-image": "assets/dummy/dummy_my_bids_product_image.png",
      "product-title": "Rolex Submariner Date Stainless Steel",
      "current-bid": 600400,
      "time-left-in-seconds": 40,
      "bid-position":
          2, // This simulates that amongst the bid places this is the position of your bid relative to amount | will be calulated in backend on may on app
    },
  ];

  List wonAuctionBids = [
    {
      "product-image": "assets/dummy/dummy_my_bids_product_image.png",
      "product-title": "Rolex Submariner Date Stainless Steel",
      "winning-bid": 600400,
      "bid-delivery-status":
          0, // This simulates the status of delivery | 0 would be initial state, 1- delivery in progress , 2 - delivery successful, 3-there was an issue with | will be calulated in backend on may on app
    },
    {
      "product-image": "assets/dummy/dummy_my_bids_product_image.png",
      "product-title": "Rolex Submariner Date Stainless Steel",
      "winning-bid": 600400,
      "bid-delivery-status":
          1, // This simulates the status of delivery | 0 would be initial state, 1- delivery in progress , 2 - delivery successful, 3-there was an issue with | will be calulated in backend on may on app
    },
    {
      "product-image": "assets/dummy/dummy_my_bids_product_image.png",
      "product-title": "Rolex Submariner Date Stainless Steel",
      "winning-bid": 600400,
      "bid-delivery-status":
          2, // This simulates the status of delivery | 0 would be initial state, 1- delivery in progress , 2 - delivery successful, 3-there was an issue with | will be calulated in backend on may on app
    },
    {
      "product-image": "assets/dummy/dummy_my_bids_product_image.png",
      "product-title": "Rolex Submariner Date Stainless Steel",
      "winning-bid": 600400,
      "bid-delivery-status":
          0, // This simulates the status of delivery | 0 would be initial state, 1- delivery in progress , 2 - delivery successful, 3-there was an issue with | will be calulated in backend on may on app
    },
    {
      "product-image": "assets/dummy/dummy_my_bids_product_image.png",
      "product-title": "Rolex Submariner Date Stainless Steel",
      "winning-bid": 600400,
      "bid-delivery-status":
          0, // This simulates the status of delivery | 0 would be initial state, 1- delivery in progress , 2 - delivery successful, 3-there was an issue with | will be calulated in backend on may on app
    },
  ];

  List lostAuctionBids = [
    {
      "product-image": "assets/dummy/dummy_my_bids_product_image.png",
      "product-title": "Rolex Submariner Date Stainless Steel",
      "winning-bid": 600400,
      "reason-for-loss":
          1, // This simulates the reason user lost the bid | 0 - user did not win, 1- user defaulted | will be calulated in backend on may on app
    },
    {
      "product-image": "assets/dummy/dummy_my_bids_product_image.png",
      "product-title": "Rolex Submariner Date Stainless Steel",
      "winning-bid": 600400,
      "reason-for-loss":
          0, // This simulates the reason user lost the bid | 0 - user did not win, 1- user defaulted | will be calulated in backend on may on app
    },
    {
      "product-image": "assets/dummy/dummy_my_bids_product_image.png",
      "product-title": "Rolex Submariner Date Stainless Steel",
      "winning-bid": 600400,
      "reason-for-loss":
          1, // This simulates the reason user lost the bid | 0 - user did not win, 1- user defaulted | will be calulated in backend on may on app
    },
    {
      "product-image": "assets/dummy/dummy_my_bids_product_image.png",
      "product-title": "Rolex Submariner Date Stainless Steel",
      "winning-bid": 600400,
      "reason-for-loss":
          0, // This simulates the reason user lost the bid | 0 - user did not win, 1- user defaulted | will be calulated in backend on may on app
    },
    {
      "product-image": "assets/dummy/dummy_my_bids_product_image.png",
      "product-title": "Rolex Submariner Date Stainless Steel",
      "winning-bid": 600400,
      "reason-for-loss":
          0, // This simulates the reason user lost the bid | 0 - user did not win, 1- user defaulted | will be calulated in backend on may on app
    },
  ];

  String getActiveBidMessage({required int bidPosition}) {
    String bidMessage = "↕️ You’ve been outbid";

    if (bidPosition == 1) {
      bidMessage = "🔥 You’re currently the highest bidder";
    }

    if (bidPosition == 2) {
      bidMessage = "🥈 You’re currently the second highest";
    }

    return bidMessage;
  }

  String getWonBidMessage({required int deliveryStatus}) {
    String bidMessage = "🏆 You won this auction!";

    if (deliveryStatus == 1) {
      bidMessage = "📦 Delivery in progress";
    }

    if (deliveryStatus == 2) {
      bidMessage = "🎉 Item received successfully";
    }

    return bidMessage;
  }

  Map<String, dynamic> getActiveBidMessageColor({required int bidPosition}) {
    Map<String, dynamic> bidMessageColor = {
      "background-color": Color(0xFFF5F5F5),
      "text-color": Color(0xFF1A1A1A),
    };

    if (bidPosition == 1) {
      bidMessageColor = {
        "background-color": Color(0xFFE8F6ED),
        "text-color": Color(0xFF16A34A),
      };
    }

    if (bidPosition == 2) {
      bidMessageColor = {
        "background-color": Color(0xFFFDF7E6),
        "text-color": Color(0xFFEAB308),
      };
    }

    return bidMessageColor;
  }

  Map<String, dynamic> getWonBidMessageColor({required int deliveryStatus}) {
    Map<String, dynamic> bidMessageColor = {
      "background-color": Color(0xFFE8F6ED),
      "text-color": Color(0xFF16A34A),
    };

    if (deliveryStatus == 1) {
      bidMessageColor = {
        "background-color": Color(0xFFFDF7E6),
        "text-color": Color(0xFFEAB308),
      };
    }

    return bidMessageColor;
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

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 16.0,
        title: Text(
          "My Bids",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
            color: Color(0xFF1A1A1A),
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 14.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFE5E5E5),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/my_bids_screen_filter_button_icon.svg",
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            "All",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.0,
                              color: Color(0xFFA5A5A5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.0),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedBuilder(
                      animation: _tabController,
                      builder: (context, _) {
                        return TabBar(
                          controller: _tabController,
                          isScrollable: true,
                          dividerColor: Colors.transparent,
                          dividerHeight: 0.0,
                          tabAlignment: TabAlignment.start,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                            color: Color(0xFF1A1A1A),
                          ),
                          unselectedLabelStyle: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0,
                            color: Color(0xFFA5A5A5),
                          ),
                          labelPadding: EdgeInsets.only(right: 24.0),
                          indicatorPadding: EdgeInsets.only(bottom: 6),
                          indicatorColor: Color(0xFF1A1A1A),
                          tabs: List.generate(myBidsScreenTabs.length, (index) {
                            final tab = myBidsScreenTabs[index];
                            final isSelected = _tabController.index == index;
                            return Tab(
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    tab["tab-icon"],
                                    colorFilter: ColorFilter.mode(
                                      isSelected
                                          ? const Color(0xFF1A1A1A)
                                          : const Color(0xFFA5A5A5),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(tab["tab-label"]),
                                ],
                              ),
                            );
                          }),
                        );
                      },
                    ),
                    SizedBox(height: 4.0),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          ListView(
                            children: activeAuctionBids.map((activeAuctionBid) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 12.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 64.0,
                                          width: 64.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              6.0,
                                            ),

                                            image: DecorationImage(
                                              image: AssetImage(
                                                activeAuctionBid["product-image"],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 12.0),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                activeAuctionBid["product-title"],
                                                style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14.0,
                                                  color: Color(0xFF1A1A1A),
                                                ),
                                              ),
                                              SizedBox(height: 8.0),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        formatNaira(
                                                          activeAuctionBid["current-bid"],
                                                        ),
                                                        style:
                                                            GoogleFonts.inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 20.0,
                                                              color: Color(
                                                                0xFF2D5DDC,
                                                              ),
                                                            ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                            "assets/icons/PBA_tag.svg",
                                                          ),
                                                          SizedBox(width: 4.0),
                                                          Text(
                                                            "Current bid",
                                                            style:
                                                                GoogleFonts.inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      12.0,
                                                                  color: Color(
                                                                    0xFF6B6B6B,
                                                                  ),
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
                                                      SizedBox(width: 1.0),
                                                      Text(
                                                        "${formatDuration(activeAuctionBid["time-left-in-seconds"])} left",
                                                        style:
                                                            GoogleFonts.inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14.0,
                                                              color: Color(
                                                                0xFFDC2626,
                                                              ),
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 14.5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 12.0,
                                            vertical: 6.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: getActiveBidMessageColor(
                                              bidPosition:
                                                  activeAuctionBid["bid-position"],
                                            )["background-color"],
                                            borderRadius: BorderRadius.circular(
                                              100.0,
                                            ),
                                          ),
                                          child: Text(
                                            getActiveBidMessage(
                                              bidPosition:
                                                  activeAuctionBid["bid-position"],
                                            ),
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.0,
                                              color: getActiveBidMessageColor(
                                                bidPosition:
                                                    activeAuctionBid["bid-position"],
                                              )["text-color"],
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 8.0,
                                              horizontal: 14.0,
                                            ),

                                            backgroundColor: Color(0xFF000000),
                                            foregroundColor: Color(0xFFFFFFFF),
                                            disabledBackgroundColor: Color(
                                              0xFFEEEEEE,
                                            ),
                                            disabledForegroundColor: Color(
                                              0xFFA5A5A5,
                                            ),
                                          ),
                                          onPressed:
                                              activeAuctionBid["bid-position"] ==
                                                  1
                                              ? null
                                              : () {},
                                          child: Text(
                                            "Place Bid",
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                          // Won
                          ListView(
                            children: wonAuctionBids.map((wonAuctionBid) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 12.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 64.0,
                                          width: 64.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              6.0,
                                            ),

                                            image: DecorationImage(
                                              image: AssetImage(
                                                wonAuctionBid["product-image"],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 12.0),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                wonAuctionBid["product-title"],
                                                style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14.0,
                                                  color: Color(0xFF1A1A1A),
                                                ),
                                              ),
                                              SizedBox(height: 8.0),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    formatNaira(
                                                      wonAuctionBid["winning-bid"],
                                                    ),
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 20.0,
                                                      color: Color(0xFF2D5DDC),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        "assets/icons/PBA_tag.svg",
                                                      ),
                                                      SizedBox(width: 4.0),
                                                      Text(
                                                        "Winning bid",
                                                        style:
                                                            GoogleFonts.inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 12.0,
                                                              color: Color(
                                                                0xFF6B6B6B,
                                                              ),
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 14.5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 12.0,
                                            vertical: 6.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: getWonBidMessageColor(
                                              deliveryStatus:
                                                  wonAuctionBid["bid-delivery-status"],
                                            )["background-color"],
                                            borderRadius: BorderRadius.circular(
                                              100.0,
                                            ),
                                          ),
                                          child: Text(
                                            getWonBidMessage(
                                              deliveryStatus:
                                                  wonAuctionBid["bid-delivery-status"],
                                            ),
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.0,
                                              color: getWonBidMessageColor(
                                                deliveryStatus:
                                                    wonAuctionBid["bid-delivery-status"],
                                              )["text-color"],
                                            ),
                                          ),
                                        ),
                                        wonAuctionBid["bid-delivery-status"] ==
                                                2
                                            ? SizedBox.shrink()
                                            : ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 8.0,
                                                    horizontal: 14.0,
                                                  ),

                                                  backgroundColor: Color(
                                                    0xFF000000,
                                                  ),
                                                  foregroundColor: Color(
                                                    0xFFFFFFFF,
                                                  ),
                                                ),
                                                onPressed: () {},
                                                child: Text(
                                                  wonAuctionBid["bid-delivery-status"] ==
                                                          0
                                                      ? "Pay now"
                                                      : wonAuctionBid["bid-delivery-status"] ==
                                                            1
                                                      ? "Mark As Received"
                                                      : "Resolve", // because button will not show if delivery was successful and another usecase is an error
                                                  style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),

                          // Lost
                          ListView(
                            children: lostAuctionBids.map((lostAuctionBid) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 64.0,
                                          width: 64.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              6.0,
                                            ),

                                            image: DecorationImage(
                                              image: AssetImage(
                                                lostAuctionBid["product-image"],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 12.0),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                lostAuctionBid["product-title"],
                                                style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14.0,
                                                  color: Color(0xFF1A1A1A),
                                                ),
                                              ),
                                              SizedBox(height: 8.0),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    formatNaira(
                                                      lostAuctionBid["winning-bid"],
                                                    ),
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 20.0,
                                                      color: Color(0xFF2D5DDC),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        "assets/icons/PBA_tag.svg",
                                                      ),
                                                      SizedBox(width: 4.0),
                                                      Text(
                                                        "Winning bid",
                                                        style:
                                                            GoogleFonts.inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 12.0,
                                                              color: Color(
                                                                0xFF6B6B6B,
                                                              ),
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 14.5),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 6.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFCE9E9),
                                        borderRadius: BorderRadius.circular(
                                          100.0,
                                        ),
                                      ),
                                      child: Text(
                                        lostAuctionBid["reason-for-loss"] == 0
                                            ? "😑 You didn’t win this time"
                                            : "😞 You defaulted on this auction",
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.0,
                                          color: Color(0xFFDC2626),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// My Bids Screen | End

// Payment Screen | Start

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWalletBalanceLow =
        false; // This is to simulate a low or high wallet balance | balance will be caluclated by backend

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //TODO:Implement back function
          },
          icon: SvgPicture.asset("assets/icons/PBA_chevron.svg"),
        ),
        centerTitle: true,
        title: Text(
          "Make Payment",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
            color: Color(0xFF1A1A1A),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "₦540,000.00",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 32.0,
                  color: Color(0xFF2D5DDC),
                ),
              ),
              SizedBox(height: 24.0),
              Container(
                padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Item",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: Color(0xFF6B6B6B),
                          ),
                        ),
                        Text(
                          "Solid Oak Classic Dining Chair",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Seller",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: Color(0xFF6B6B6B),
                          ),
                        ),
                        Text(
                          "Josh_King",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 32.0),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final dashCount = (constraints.maxWidth / (4 + 4))
                            .floor();

                        return Row(
                          children: List.generate(dashCount, (_) {
                            return Padding(
                              padding: EdgeInsets.only(right: 4),
                              child: SizedBox(
                                width: 4,
                                height: 0.5,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF1E1E1E),
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),

                    SizedBox(height: 32.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Winning Bid",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: Color(0xFF6B6B6B),
                          ),
                        ),
                        Text(
                          "₦600,400.00", // TODO: Remember to Use format Naira when working with mock/real Data
                          textAlign: TextAlign.end,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bid Commitment (10%)",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: Color(0xFF6B6B6B),
                          ),
                        ),
                        Text(
                          "-₦60,400.00",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Balance to Pay",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                        Text(
                          "₦540,000.00",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 32.0),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final dashCount = (constraints.maxWidth / (4 + 4))
                            .floor();

                        return Row(
                          children: List.generate(dashCount, (_) {
                            return Padding(
                              padding: EdgeInsets.only(right: 4),
                              child: SizedBox(
                                width: 4,
                                height: 0.5,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF1E1E1E),
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                    SizedBox(height: 32.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Wallet Balance",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: Color(0xFF6B6B6B),
                          ),
                        ),
                        Text(
                          isWalletBalanceLow == true
                              ? "₦200,400.00"
                              : "₦900,400.00",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: isWalletBalanceLow == true
                                ? Color(0xFFDC2626)
                                : Color(0xFF16A34A),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.0),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: Color(0xFFEAEFFC),
                  border: Border.all(width: 0.5, color: Color(0xFF2D5DDC)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/icons/PBA_lock.svg"),
                    SizedBox(width: 20.0),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text:
                              "Your payment goes into escrow, so your money stays secure while the seller ships your item.",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: Color(0xFF2D5DDC),
                          ),
                          children: [
                            TextSpan(text: " "),
                            TextSpan(
                              text: "Learn More",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                fontSize: 14.0,
                                color: Color(0xFF2D5DDC),
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

              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0Xff000000),
                    foregroundColor: Color(0xFFFFFFFF),
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 12.0,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    isWalletBalanceLow == true ? "Fund Wallet" : "Make Payment",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
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

// Payment Screen | End

// Wallet Screen | Start

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWalletActivated = true;
    bool isWalletBalanceLow = true;
    bool isTransactionHistoryEmpty = false;

    bool isWalletVisible = true;

    List walletTransactions = [
      {
        "transaction-title":
            "Payment received for Solid Oak Classic Dining Chair",
        "time-of-transaction": "Just now",
        "transaction-amount": 600400,
        "transaction-state": 0, // 0 - process , 1 - successful, 2 - error
        "transaction-type": 2, // 1 - debit , 2 credit
      },

      {
        "transaction-title": "Withdrawal",
        "time-of-transaction": "Today   09:21 AM",
        "transaction-amount": 700000,
        "transaction-state": 1, // 0 - process , 1 - successful, 2 - error
        "transaction-type": 1, // 1 - debit , 2 credit
      },

      {
        "transaction-title":
            "Payment made for Lamborghini Aventador LP 780-4 Ultimate",
        "time-of-transaction": "Yesterday   09:21 AM",
        "transaction-amount": 700000,
        "transaction-state": 1, // 0 - process , 1 - successful, 2 - error
        "transaction-type": 1, // 1 - debit , 2 credit
      },

      {
        "transaction-title": "Default fee charge",
        "time-of-transaction": "Yesterday   08:21 AM",
        "transaction-amount": 700000,
        "transaction-state": 1, // 0 - process , 1 - successful, 2 - error
        "transaction-type": 1, // 1 - debit , 2 credit
      },
      {
        "transaction-title": "Default fee charge",
        "time-of-transaction": "12 Sept. 2025   09:21 AM",
        "transaction-amount": 700000,
        "transaction-state": 1, // 0 - process , 1 - successful, 2 - error
        "transaction-type": 2, // 1 - debit , 2 credit
      },
      {
        "transaction-title": "Wallet top up",
        "time-of-transaction": "14 Sept. 2025   09:21 AM",
        "transaction-amount": 700000,
        "transaction-state": 1, // 0 - process , 1 - successful, 2 - error
        "transaction-type": 2, // 1 - debit , 2 credit
      },
    ];

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

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Wallet",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
            color: Color(0xFF1A1A1A),
          ),
        ),
        actions: isWalletActivated == true
            ? [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),

                  child: SvgPicture.asset("assets/icons/PBA_info.svg"),
                ),
              ]
            : [],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: isWalletActivated == false
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset("assets/icons/PBA_wallet.svg"),
                      SizedBox(height: 16.0),
                      Text(
                        "Activate your wallet",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        "You need to verify your identity before you can fund, withdraw, or use your virtual wallet.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                          color: Color(0xFF6B6B6B),
                        ),
                      ),
                      SizedBox(height: 28.0),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF000000),
                                foregroundColor: Color(0xFFFFFFFF),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24.0,
                                  vertical: 12.0,
                                ),
                              ),
                              onPressed: () {
                                //TODO: Implement Start Verification function
                              },
                              child: Text(
                                "Start Verification",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12.0),
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Color(0xFF000000),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24.0,
                                  vertical: 12.0,
                                ),
                              ),
                              onPressed: () {
                                // TODO: Implement Back to home function
                              },
                              child: Text(
                                "Back to Home",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 32.0,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFC4F03B),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Available Balance",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.0,
                                  color: Color(0xFF1E1E1E),
                                ),
                              ),
                              SizedBox(width: 6.0),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  isWalletVisible == true
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Color(0xFF1E1E1E),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            isWalletVisible == true
                                ? "${isWalletBalanceLow == true ? formatNaira(0) : formatNaira(900950)}.00"
                                : "****",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              fontSize: 32.0,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.0),

                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF000000),
                              foregroundColor: Color(0xFFFFFFFF),
                              padding: EdgeInsets.symmetric(
                                horizontal: 24.0,
                                vertical: 12.0,
                              ),
                            ),
                            onPressed: () {},
                            label: Text(
                              "Fund Wallet",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            ),

                            icon: SvgPicture.asset("assets/icons/PBA_plus.svg"),
                          ),
                        ),
                        SizedBox(width: 12.0),
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFC4F03B),
                              foregroundColor: Color(0xFF000000),
                              disabledBackgroundColor: Color(0xFFEEEEEE),
                              disabledForegroundColor: Color(0xFFA5A5A5),
                              padding: EdgeInsets.symmetric(
                                horizontal: 24.0,
                                vertical: 12.0,
                              ),
                            ),
                            onPressed: isWalletBalanceLow == true
                                ? null
                                : () {},
                            label: Text(
                              "Withdraw",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            ),

                            icon: SvgPicture.asset(
                              "assets/icons/diagonal_arrow.svg",
                              colorFilter: ColorFilter.mode(
                                isWalletBalanceLow == true
                                    ? const Color(0xFFA5A5A5)
                                    : const Color(0xFF000000),
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 40.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Transactions",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),

                        isTransactionHistoryEmpty == false
                            ? GestureDetector(
                                onTap: () {
                                  // TODO: implement view all function
                                },
                                child: Text(
                                  "View All",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                    color: Color(0xFF8BAA2A),
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),

                    isTransactionHistoryEmpty == true
                        ? Expanded(
                            child: Column(
                              children: [
                                Spacer(),

                                SvgPicture.asset("assets/icons/PBA_empty.svg"),
                                SizedBox(height: 16.0),
                                Text(
                                  "No transactions yet",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.0,
                                    color: Color(0xFF1A1A1A),
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  "Your wallet is active. You will see your payments and withdrawals here once you start using it.",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0,
                                    color: Color(0xFF6B6B6B),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.only(top: 16.0),
                              itemCount: walletTransactions.length,
                              itemBuilder: (context, index) {
                                var walletTransaction =
                                    walletTransactions[index];

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              walletTransaction["transaction-type"] ==
                                                      2
                                                  ? "assets/icons/transaction_icons/transaction_type_icon_credit.svg"
                                                  : "assets/icons/transaction_icons/transaction_type_icon_debit.svg",
                                            ),
                                            const SizedBox(width: 12),

                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    walletTransaction["transaction-title"],

                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14.0,
                                                      color: Color(0xFF1A1A1A),
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    walletTransaction["time-of-transaction"],
                                                    style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12.0,
                                                      color: Color(0xFF6B6B6B),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(width: 16),

                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "${walletTransaction["transaction-type"] == 2 ? "+" : "-"}${formatNaira(walletTransaction["transaction-amount"])}",
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15.0,
                                              color: Color(0xFF1A1A1A),
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            walletTransaction["transaction-state"] ==
                                                    0
                                                ? "Processing"
                                                : "Successful",
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.0,
                                              color:
                                                  walletTransaction["transaction-state"] ==
                                                      0
                                                  ? Color(0xFFA5A5A5)
                                                  : Color(0xFF16A34A),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                  ],
                ),
        ),
      ),
    );
  }
}

// Wallet Screen | End

// BVN Verification Screen | Start

class BvnVerificationScreen extends StatelessWidget {
  const BvnVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF000000),
              foregroundColor: Color(0xFFFFFFFF),
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            ),
            onPressed: () {},
            child: Text(
              "Verify",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //TODO:Implement back function
          },
          icon: SvgPicture.asset("assets/icons/PBA_chevron.svg"),
        ),

        centerTitle: true,
        title: Text(
          "Wallet Activation",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
            color: Color(0xFF1A1A1A),
          ),
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
                  "Enter Your BVN",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 24.0,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  "We use your BVN to confirm your identity. It cannot access your bank account.",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                    color: Color(0xFF6B6B6B),
                  ),
                ),
                SizedBox(height: 32.0),
                Text(
                  "BVN",
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
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter 11 digit number",
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
      ),
    );
  }
}

// BVN Verfication Screen | End

// Confirm BVN Details Screen | Start

class ConfirmBVNDetailsScreen extends StatelessWidget {
  const ConfirmBVNDetailsScreen({super.key});

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

        centerTitle: true,
        title: Text(
          "Wallet Activation",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
            color: Color(0xFF1A1A1A),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF000000),
              foregroundColor: Color(0xFFFFFFFF),
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            ),
            onPressed: () {},
            child: Text(
              "Continue",
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
          padding: EdgeInsets.all(16.0).copyWith(top: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Confirm Your Details",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 24.0,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "These details match the records linked to your BVN.",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.0,
                  color: Color(0xFF6B6B6B),
                ),
              ),
              SizedBox(height: 32.0),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Full Name",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0,
                            color: Color(0xFF6B6B6B),
                          ),
                        ),
                        Text(
                          "Okorometa Japheth",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phone Number",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0,
                            color: Color(0xFF6B6B6B),
                          ),
                        ),
                        Text(
                          "08123748484",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date of Birth",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0,
                            color: Color(0xFF6B6B6B),
                          ),
                        ),
                        Text(
                          "15th June, 1999",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Confirm BVN Details Screen | End

// Add Bank Account Screen | Start

class AddBankAccountScreen extends StatelessWidget {
  const AddBankAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isValueEntered =
        true; // This siumlates the different state of the add our account screen
    bool isValueReturned =
        true; // This siumlates the different state of the add our account screen
    bool isValueValid =
        false; // This siumlates the different state of the add our account screen

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //TODO:Implement back function
          },
          icon: SvgPicture.asset("assets/icons/PBA_chevron.svg"),
        ),

        centerTitle: true,
        title: Text(
          "Wallet Activation",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
            color: Color(0xFF1A1A1A),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF000000),
              foregroundColor: Color(0xFFFFFFFF),
              disabledBackgroundColor: Color(0xFFEEEEEE),
              disabledForegroundColor: Color(0xFFA5A5A5),
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            ),
            onPressed: isValueEntered == false || isValueValid == false
                ? null
                : () {},
            child: Text(
              "Continue",
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
          padding: EdgeInsets.all(16.0).copyWith(top: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add your bank account",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 24.0,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "This account will receive your withdrawals. Make sure the name on BVN matches the details of the bank account provided.",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.0,
                  color: Color(0xFF6B6B6B),
                ),
              ),
              SizedBox(height: 32.0),

              Text(
                "BVN",
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
                keyboardType: TextInputType.text,

                decoration: InputDecoration(
                  hintText: "Type to search",
                  hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Color(0xFFA5A5A5),
                  ),

                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      "assets/icons/add_bank_account_dropdown_icon.svg",
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
              Text(
                "Account Number",
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
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter 11 digit number",
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
              SizedBox(height: 8.0),
              isValueEntered == true && isValueReturned == true
                  ? Text(
                      "OKOROMETA JAPHETH",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                        color: Color(0xFF16A34A),
                      ),
                    )
                  : SizedBox.shrink(),
              SizedBox(height: 21.0),
              isValueReturned == true && isValueValid == false
                  ? Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFFCE9E9),
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Color(0xFFDC2626),
                          width: 0.5,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/add_back_account_error_icon.svg",
                          ),
                          SizedBox(width: 14.25),
                          Expanded(
                            child: Text(
                              "The BVN name does not match the bank account name. Use your own BVN and bank account.",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                                color: Color(0xFFDC2626),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

// Add Bank Account  Screen | End

// Transaction History Screen | Start

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List walletTransactions = [
      {
        "transaction-title":
            "Payment received for Solid Oak Classic Dining Chair",
        "time-of-transaction": "Just now",
        "transaction-amount": 600400,
        "transaction-state": 0, // 0 - process , 1 - successful, 2 - error
        "transaction-type": 2, // 1 - debit , 2 credit
      },

      {
        "transaction-title": "Withdrawal",
        "time-of-transaction": "Today   09:21 AM",
        "transaction-amount": 700000,
        "transaction-state": 1, // 0 - process , 1 - successful, 2 - error
        "transaction-type": 1, // 1 - debit , 2 credit
      },

      {
        "transaction-title":
            "Payment made for Lamborghini Aventador LP 780-4 Ultimate",
        "time-of-transaction": "Yesterday   09:21 AM",
        "transaction-amount": 700000,
        "transaction-state": 1, // 0 - process , 1 - successful, 2 - error
        "transaction-type": 1, // 1 - debit , 2 credit
      },

      {
        "transaction-title": "Default fee charge",
        "time-of-transaction": "Yesterday   08:21 AM",
        "transaction-amount": 700000,
        "transaction-state": 1, // 0 - process , 1 - successful, 2 - error
        "transaction-type": 1, // 1 - debit , 2 credit
      },
      {
        "transaction-title": "Default fee charge",
        "time-of-transaction": "12 Sept. 2025   09:21 AM",
        "transaction-amount": 700000,
        "transaction-state": 1, // 0 - process , 1 - successful, 2 - error
        "transaction-type": 2, // 1 - debit , 2 credit
      },

      {
        "transaction-title":
            "Payment refund for Solid Oak Classic Dining Chairr",
        "time-of-transaction": "12 Sept. 2025   09:21 AM",
        "transaction-amount": 700000,
        "transaction-state": 1, // 0 - process , 1 - successful, 2 - error
        "transaction-type": 2, // 1 - debit , 2 credit
      },

      {
        "transaction-title": "Payment made for Solid Oak Classic Dining Chair",
        "time-of-transaction": "13 Sept. 2025   09:5 AM",
        "transaction-amount": 665000,
        "transaction-state": 2, // 0 - process , 1 - successful, 2 - error
        "transaction-type": 1, // 1 - debit , 2 credit
      },

      {
        "transaction-title": "Bid commitment fee ",
        "time-of-transaction": "13 Sept. 2025   09:5 AM",
        "transaction-amount": 35000,
        "transaction-state": 2, // 0 - process , 1 - successful, 2 - error
        "transaction-type": 1, // 1 - debit , 2 credit
      },

      {
        "transaction-title": "Bid commitment fee refund ",
        "time-of-transaction": "13 Sept. 2025   09:5 AM",
        "transaction-amount": 40000,
        "transaction-state": 1, // 0 - process , 1 - successful, 2 - error
        "transaction-type": 2, // 1 - debit , 2 credit
      },
      {
        "transaction-title": "Wallet top up",
        "time-of-transaction": "14 Sept. 2025   09:21 AM",
        "transaction-amount": 2500000,
        "transaction-state": 1, // 0 - process , 1 - successful, 2 - error
        "transaction-type": 2, // 1 - debit , 2 credit
      },
    ];

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

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //TODO:Implement back function
          },
          icon: SvgPicture.asset("assets/icons/PBA_chevron.svg"),
        ),
        centerTitle: true,
        title: Text(
          "Transaction History",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
            color: Color(0xFF1A1A1A),
          ),
        ),
      ),

      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: walletTransactions.length,
          itemBuilder: (context, index) {
            var walletTransaction = walletTransactions[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          walletTransaction["transaction-type"] == 2
                              ? "assets/icons/transaction_icons/transaction_type_icon_credit.svg"
                              : "assets/icons/transaction_icons/transaction_type_icon_debit.svg",
                        ),
                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                walletTransaction["transaction-title"],

                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0,
                                  color: Color(0xFF1A1A1A),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                walletTransaction["time-of-transaction"],
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.0,
                                  color: Color(0xFF6B6B6B),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 16),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${walletTransaction["transaction-type"] == 2 ? "+" : "-"}${formatNaira(walletTransaction["transaction-amount"])}",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        walletTransaction["transaction-state"] == 0
                            ? "Processing"
                            : walletTransaction["transaction-state"] == 1
                            ? "Successful"
                            : "Escrow",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: walletTransaction["transaction-state"] == 1
                              ? Color(0xFF16A34A)
                              : Color(0xFFA5A5A5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// Transaction History Screen. | End

// Transaction Details Screen | Start

class TransactionDetailsScreen extends StatelessWidget {
  const TransactionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var transactionDetailsWalletTopUp = {
      "transaction-amount": 600400,
      "transaction-type": 2, // 1 - debit , 2 - credit
      "transaction-status": 1, // 0 - escrow, 1 - successful, 2 - error,
      "transaction-date": "Today • 09:21 AM",
      "transaction-id": "TXN-8GH29MD",
      "transaction-payment-method": 1,
      "transaction-reference": "PSTK-1829SKW2",
    };

    var transactionDetailsWithdrawal = {
      "transaction-amount": 600400,
      "transaction-type": 1, // 1 - debit , 2 - credit
      "transaction-status": 1, // 0 - escrow, 1 - successful, 2 - error,
      "transaction-category":
          1, // 0 - wallet, 1 - bank transfer, 3 commitmentFee
      "transaction-date": "Today • 09:21 AM",
      "transaction-id": "TXN-8GH29MD",
      "transaction-payment-method": 2, // 1 - wallet 2 - bank transfer
      "recipient": "Okorometa Japheth",
      "recipient-account-details": {
        "account-number": "0094108831",
        "bank-name": "First Bank",
      },
      "transaction-reference": "PSTK-1829SKW2",
    };

    var transactionDetailsCommitmentFee = {
      "transaction-amount": 35000,
      "transaction-type": 1, // 1 - debit , 2 - credit
      "transaction-status": 0, // 0 - escrow, 1 - successful, 2 - error,
      "transaction-date": "Today • 09:21 AM",
      "transaction-payment-method": 1, // 1 - wallet 2 - bank transfer
      "transaction-category":
          3, // 0 - wallet, 1 - bank transfer, 3 commitmentFee
      "product": {
        "title": "Solid Oak Classic Dining Chair",
        "seller": "Josh_king",
        "commitment-fee-in-percent": 10,
        "bid": 700000,
      },
      "transaction-reference": "PSTK-1829SKW2",
    };

    var transactionDetailsCommitmentFeeRefund = {
      "transaction-amount": 35000,
      "transaction-type": 2, // 1 - debit , 2 - credit
      "transaction-status": 1, // 0 - escrow, 1 - successful, 2 - error,
      "transaction-date": "Today • 09:21 AM",
      "transaction-payment-method": 1, // 1 - wallet 2 - bank transfer
      "transaction-category":
          3, // 0 - wallet, 1 - bank transfer, 3 commitmentFee
      "product": {
        "title": "Solid Oak Classic Dining Chair",
        "seller": "Josh_king",
        "commitment-fee-in-percent": 10,
        "bid": 700000,
      },
      "transaction-reference": "PSTK-1829SKW2",
    };

    var transactionDetailsPaymentMade = {
      "transaction-amount": 700000,
      "transaction-type": 2, // 1 - debit , 2 - credit
      "transaction-status": 1, // 0 - escrow, 1 - successful, 2 - error,
      "transaction-date": "Today • 09:21 AM",
      "transaction-payment-method": 1, // 1 - wallet 2 - bank transfer
      "transaction-category":
          3, // 0 - wallet, 1 - bank transfer, 3 commitmentFee 4 paymentMade
      "product": {
        "title": "Solid Oak Classic Dining Chair",
        "seller": "Josh_king",
        "commitment-fee-in-percent": 10,
        "bid": 700000,
      },
      "transaction-reference": "PSTK-1829SKW2",
    };

    var selectedTransactionDetails = transactionDetailsPaymentMade;

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

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //TODO:Implement back function
          },
          icon: SvgPicture.asset("assets/icons/PBA_chevron.svg"),
        ),
        centerTitle: true,
        title: Text(
          "Transaction Details",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
            color: Color(0xFF1A1A1A),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16.0),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF000000),
              foregroundColor: Color(0xFFFFFFFF),
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            ),
            onPressed: () {},
            label: Text(
              "Share Receipt",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
            icon: SvgPicture.asset("assets/icons/PBA_share.svg"),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 24.0, top: 16.0),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      selectedTransactionDetails["transaction-type"] == 1
                          ? "assets/icons/transaction_icons/transaction_details_debit_image.svg"
                          : "assets/icons/transaction_icons/transaction_details_credit_image.svg",
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "${selectedTransactionDetails["transaction-type"] == 1 ? "-" : "+"}${formatNaira(selectedTransactionDetails["transaction-amount"] as int)}",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 24.0,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      "Wallet Top up", // create a function for all types of transactions
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        color: Color(0xFF6B6B6B),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 32.0),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Status",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: Color(0xFF6B6B6B),
                          ),
                        ),
                        Text(
                          selectedTransactionDetails["transaction-status"] == 1
                              ? "Successful"
                              : "In escrow",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color:
                                selectedTransactionDetails["transaction-status"] ==
                                    1
                                ? Color(0xFF16A34A)
                                : Color(0xFFA5A5A5),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Transaction Date",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: Color(0xFF6B6B6B),
                          ),
                        ),
                        Text(
                          selectedTransactionDetails["transaction-date"]
                              as String,
                          textAlign: TextAlign.end,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.0),
                    selectedTransactionDetails["transaction-category"] == 3
                        ? SizedBox.shrink()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Transaction ID",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                  color: Color(0xFF6B6B6B),
                                ),
                              ),
                              Text(
                                selectedTransactionDetails["transaction-id"]
                                    as String,
                                textAlign: TextAlign.end,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                  color: Color(0xFF1A1A1A),
                                ),
                              ),
                            ],
                          ),
                    selectedTransactionDetails["transaction-category"] == 3
                        ? SizedBox.shrink()
                        : SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedTransactionDetails["transaction-category"] ==
                                      3 &&
                                  selectedTransactionDetails["transaction-type"] ==
                                      2
                              ? "Refund Type"
                              : "Payment Method",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: Color(0xFF6B6B6B),
                          ),
                        ),

                        selectedTransactionDetails["transaction-category"] ==
                                    3 &&
                                selectedTransactionDetails["transaction-type"] ==
                                    2
                            ? Text(
                                "Escrow Refund",
                                textAlign: TextAlign.end,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                  color: Color(0xFF1A1A1A),
                                ),
                              )
                            : Text(
                                selectedTransactionDetails["transaction-payment-method"] ==
                                        1
                                    ? "Wallet"
                                    : "Bank Transfer",
                                textAlign: TextAlign.end,
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                  color: Color(0xFF1A1A1A),
                                ),
                              ),
                      ],
                    ),
                    SizedBox(height: 24.0),
                    selectedTransactionDetails["transaction-payment-method"] ==
                            2
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Recipient",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0,
                                      color: Color(0xFF6B6B6B),
                                    ),
                                  ),
                                  Text(
                                    selectedTransactionDetails["recipient"]
                                        as String,
                                    textAlign: TextAlign.end,
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0,
                                      color: Color(0xFF1A1A1A),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 24.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Account Details",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0,
                                      color: Color(0xFF6B6B6B),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "${(selectedTransactionDetails["recipient-account-details"] as Map<String, dynamic>)["account-number"]}",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0,
                                          color: Color(0xFF1A1A1A),
                                        ),
                                      ),
                                      Text(
                                        "${(selectedTransactionDetails["recipient-account-details"] as Map<String, dynamic>)["bank-name"]}",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0,
                                          color: Color(0xFF1A1A1A),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              SizedBox(height: 24.0),
                            ],
                          )
                        : SizedBox.shrink(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Reference",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: Color(0xFF6B6B6B),
                          ),
                        ),
                        Text(
                          selectedTransactionDetails["transaction-reference"]
                              as String,
                          textAlign: TextAlign.end,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ],
                    ),

                    selectedTransactionDetails["transaction-category"] == 3
                        ? Column(
                            children: [
                              SizedBox(height: 32.0),
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  final dashCount =
                                      (constraints.maxWidth / (4 + 4)).floor();

                                  return Row(
                                    children: List.generate(dashCount, (_) {
                                      return Padding(
                                        padding: EdgeInsets.only(right: 4),
                                        child: SizedBox(
                                          width: 4,
                                          height: 0.5,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: Color(0xFF1E1E1E),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                              SizedBox(height: 32.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Item",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0,
                                      color: Color(0xFF6B6B6B),
                                    ),
                                  ),
                                  Text(
                                    "${(selectedTransactionDetails["product"] as Map<String, dynamic>)["title"]}",
                                    textAlign: TextAlign.end,
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0,
                                      color: Color(0xFF1A1A1A),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 24.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Seller",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0,
                                      color: Color(0xFF6B6B6B),
                                    ),
                                  ),
                                  Text(
                                    "${(selectedTransactionDetails["product"] as Map<String, dynamic>)["seller"]}",
                                    textAlign: TextAlign.end,
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0,
                                      color: Color(0xFF1A1A1A),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 24.0),
                              selectedTransactionDetails["transaction-category"] ==
                                      3
                                  ? SizedBox.shrink()
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Commitment Fee (10%)",
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.0,
                                            color: Color(0xFF6B6B6B),
                                          ),
                                        ),
                                        Text(
                                          "${formatNaira(selectedTransactionDetails["transaction-amount"] as int)} in escrow",
                                          textAlign: TextAlign.end,
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.0,
                                            color: Color(0xFF1A1A1A),
                                          ),
                                        ),
                                      ],
                                    ),
                              selectedTransactionDetails["transaction-category"] ==
                                      3
                                  ? SizedBox.shrink()
                                  : SizedBox(height: 24.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Bid",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0,
                                      color: Color(0xFF6B6B6B),
                                    ),
                                  ),
                                  Text(
                                    formatNaira(
                                      (selectedTransactionDetails["product"]
                                          as Map<String, dynamic>)["bid"],
                                    ),
                                    textAlign: TextAlign.end,
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0,
                                      color: Color(0xFF1A1A1A),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Transaction Details Screen | End

// Fund Wallet Screen | Start

class FundWalletScreen extends StatelessWidget {
  const FundWalletScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF000000),
              foregroundColor: Color(0xFFFFFFFF),
              disabledBackgroundColor: Color(0xFFEEEEEE),
              disabledForegroundColor: Color(0xFFA5A5A5),
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            ),
            onPressed: () {},
            child: Text(
              "Continue",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
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
                  "Fund Wallet",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 24.0,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Enter the amount you want to add to your wallet.",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                    color: Color(0xFF6B6B6B),
                  ),
                ),
                SizedBox(height: 32.0),
                TextField(
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Color(0xFF1E1E1E),
                  ),
                  cursorColor: Color(0xFF1E1E1E),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "0.00",
                    hintStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                      color: Color(0xFFA5A5A5),
                    ),

                    prefixText: "₦",
                    prefixStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Color(0xFF1A1A1A),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),

                      borderSide: BorderSide(
                        width: 1.0,
                        color: Color(0xFFE5E5E5),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),

                      borderSide: BorderSide(
                        width: 1.0,
                        color: Color(0xFF1E1E1E),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),

                      borderSide: BorderSide(
                        width: 1.0,
                        color: Color(0xFFE5E5E5),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.0),

                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          border: Border.all(
                            color: Color(0xFFE5E5E5),
                            width: 1.0,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            formatNaira(5000),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 24.0),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.0),

                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          border: Border.all(
                            color: Color(0xFFE5E5E5),
                            width: 1.0,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            formatNaira(10000),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 24.0),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          border: Border.all(
                            color: Color(0xFFE5E5E5),
                            width: 1.0,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            formatNaira(50000),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.0),

                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          border: Border.all(
                            color: Color(0xFFE5E5E5),
                            width: 1.0,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            formatNaira(100000),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 24.0),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.0),

                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          border: Border.all(
                            color: Color(0xFFE5E5E5),
                            width: 1.0,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            formatNaira(500000),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 24.0),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.0),

                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          border: Border.all(
                            color: Color(0xFFE5E5E5),
                            width: 1.0,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            formatNaira(1000000),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40.0),

                Text(
                  "Select Payment Method",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                    color: Color(0xFF1B1B1B),
                  ),
                ),

                SizedBox(height: 16.0),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFE5E5E5),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/PBA_card.svg"),
                              SizedBox(width: 12.0),
                              Text(
                                "Pay with card",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0,
                                  color: Color(0xFF1B1B1B),
                                ),
                              ),
                            ],
                          ),

                          Radio(value: true),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFE5E5E5),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/google_pay_icon.svg",
                              ),
                              SizedBox(width: 12.0),
                              Text(
                                "Google Pay",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0,
                                  color: Color(0xFF1B1B1B),
                                ),
                              ),
                            ],
                          ),

                          Radio(value: true),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFE5E5E5),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/apple_pay_icon.svg",
                              ),
                              SizedBox(width: 12.0),
                              Text(
                                "Apple Pay",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0,
                                  color: Color(0xFF1B1B1B),
                                ),
                              ),
                            ],
                          ),

                          Radio(
                            value: false,
                            toggleable: true,
                          ), // TODO: Implement Radio Function
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Fund Wallet Screen | End

// Withdraw Funds Screen. | Start

class WithdrawFundScreen extends StatelessWidget {
  const WithdrawFundScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF000000),
              foregroundColor: Color(0xFFFFFFFF),
              disabledBackgroundColor: Color(0xFFEEEEEE),
              disabledForegroundColor: Color(0xFFA5A5A5),
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            ),
            onPressed: () {},
            child: Text(
              "Withdraw Funds",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
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
                  "Withdraw Funds",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 24.0,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Enter the amount you want to withdraw.",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                    color: Color(0xFF6B6B6B),
                  ),
                ),
                SizedBox(height: 32.0),
                TextField(
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Color(0xFF1E1E1E),
                  ),
                  cursorColor: Color(0xFF1E1E1E),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "0.00",
                    hintStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                      color: Color(0xFFA5A5A5),
                    ),

                    prefixText: "₦",
                    prefixStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Color(0xFF1A1A1A),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),

                      borderSide: BorderSide(
                        width: 1.0,
                        color: Color(0xFFE5E5E5),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),

                      borderSide: BorderSide(
                        width: 1.0,
                        color: Color(0xFF1E1E1E),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),

                      borderSide: BorderSide(
                        width: 1.0,
                        color: Color(0xFFE5E5E5),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.0),

                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          border: Border.all(
                            color: Color(0xFFE5E5E5),
                            width: 1.0,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            formatNaira(5000),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 24.0),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.0),

                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          border: Border.all(
                            color: Color(0xFFE5E5E5),
                            width: 1.0,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            formatNaira(10000),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 24.0),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          border: Border.all(
                            color: Color(0xFFE5E5E5),
                            width: 1.0,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            formatNaira(50000),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.0),

                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          border: Border.all(
                            color: Color(0xFFE5E5E5),
                            width: 1.0,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            formatNaira(100000),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 24.0),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.0),

                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          border: Border.all(
                            color: Color(0xFFE5E5E5),
                            width: 1.0,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            formatNaira(500000),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 24.0),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.0),

                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          border: Border.all(
                            color: Color(0xFFE5E5E5),
                            width: 1.0,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            formatNaira(1000000),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40.0),

                Text(
                  "Select Recipient",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                    color: Color(0xFF1B1B1B),
                  ),
                ),

                SizedBox(height: 16.0),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFE5E5E5),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [Text("0094108831"), Text("First Bank")],
                          ),
                          Text("Okorometa Japheth"),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Withdraw Funds Screen. | End
