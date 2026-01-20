import 'package:auctave_mobile_app/gen/colors.gen.dart';
import 'package:auctave_mobile_app/ui/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? editingController;
  final TextInputType? inputType;

  const AppTextField({
    super.key,
    required this.label,
    required this.hint,
    this.editingController,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyle.kPBA14pxMedium.copyWith(
              color: ColorName.pbaTextPrimary,
            ),
          ),
          SizedBox(height: 8.0),
          TextField(
            controller: editingController,
            style: AppTextStyle.kPBA16pxRegular.copyWith(
              color: ColorName.pbaTextPrimary,
            ),
            cursorColor: ColorName.pbaBlackAccent,
            keyboardType: inputType,
            decoration: InputDecoration(hintText: hint),
          ),
        ],
      ),
    );
  }
}
