import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreenIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconPath;
  const LoginScreenIconButton({
    super.key,
    required this.onPressed,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: OutlinedButton(
          onPressed: onPressed,
          child: SvgPicture.asset(iconPath),
        ),
      ),
    );
  }
}
