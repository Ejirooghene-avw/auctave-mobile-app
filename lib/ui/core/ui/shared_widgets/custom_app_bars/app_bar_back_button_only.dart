import 'package:auctave_mobile_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarBackButtonOnly extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback? onPressedBackButton;
  const AppBarBackButtonOnly({super.key, this.onPressedBackButton});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed:
            onPressedBackButton ??
            () {
              //TODO:Implement back function
              Navigator.pop(context);
            },
        icon: SvgPicture.asset(Assets.icons.pBAChevron),
      ),
    );
  }
}
