import 'package:auctave_mobile_app/gen/colors.gen.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_strings/app_strings.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class AppPasswordTextField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController? editingController;

  const AppPasswordTextField({
    super.key,
    this.label = AppStrings.textFieldLabelPassword,
    this.hint = AppStrings.textFieldHintPassword,
    this.editingController,
  });

  @override
  State<AppPasswordTextField> createState() => _AppPasswordTextFieldState();
}

class _AppPasswordTextFieldState extends State<AppPasswordTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: AppTextStyle.kPBA14pxMedium.copyWith(
              color: ColorName.pbaTextPrimary,
            ),
          ),
          SizedBox(height: 8.0),
          TextField(
            obscureText: !isPasswordVisible,
            controller: widget.editingController,
            style: AppTextStyle.kPBA16pxRegular.copyWith(
              color: ColorName.pbaTextPrimary,
            ),
            cursorColor: ColorName.pbaBlackAccent,
            decoration: InputDecoration(
              hintText: widget.hint,
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
            ),
          ),
        ],
      ),
    );
  }
}
