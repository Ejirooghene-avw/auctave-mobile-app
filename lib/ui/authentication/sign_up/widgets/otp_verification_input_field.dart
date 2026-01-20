import 'package:auctave_mobile_app/gen/colors.gen.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class OTPVerificationInputField extends StatefulWidget {
  const OTPVerificationInputField({super.key});

  @override
  State<OTPVerificationInputField> createState() => _VerifyOTPInputFieldState();
}

class _VerifyOTPInputFieldState extends State<OTPVerificationInputField> {
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
    return Padding(
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
                style: AppTextStyle.kPBA28pxMedium.copyWith(
                  color: ColorName.pbaBlackAccent,
                ),
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                cursorColor: ColorName.pbaBlackAccent,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  counter: SizedBox.shrink(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 9.5,
                    vertical: 10.0,
                  ),
                ),
                onChanged: (value) => _onChanged(value, index),
              ),
            ),
          );
        }),
      ),
    );
  }
}
