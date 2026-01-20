import 'package:auctave_mobile_app/ui/authentication/sign_up/view_model/sign_up_screen_view_model.dart';
import 'package:auctave_mobile_app/ui/authentication/sign_up/widgets/sign_up_widgets.dart';
import 'package:auctave_mobile_app/ui/core/ui/shared_widgets/custom_app_bars/app_bar_back_button_only.dart';
import 'package:auctave_mobile_app/ui/core/ui/shared_widgets/shared_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpScreenViewModel viewModel = context.watch<SignUpScreenViewModel>();
    SignUpScreenViewModel viewModelAction = context
        .read<SignUpScreenViewModel>();
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBarBackButtonOnly(
          onPressedBackButton: () {
            if (viewModel.shouldExit == true) {
              Navigator.pop(context);
            } else {
              viewModelAction.moveToPreviousPage();
            }
          },
        ),
        bottomNavigationBar: AppBottomButtonTermsAndPrivacy(
          child: ElevatedButton(
            onPressed: viewModelAction.proceed,
            child: Text(viewModel.viewButtonText),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0).copyWith(top: 40.0),
            child: Expanded(
              child: PageView(
                controller: viewModel.pageController,
                onPageChanged: viewModelAction.updateSlideIndex,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  PersonalDetailsSignUpScreen(),
                  VerifyPhoneNumberSignUpScreen(),
                  VerifyOTPSignUpScreen(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
