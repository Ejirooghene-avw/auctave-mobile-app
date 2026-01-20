import 'package:auctave_mobile_app/ui/onboarding/view_model/onboarding_screen_view_model.dart';
import 'package:auctave_mobile_app/ui/splash/view_model/splash_screen_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => SplashScreenViewModel()),
    ChangeNotifierProvider(create: (_) => OnboardingScreenViewModel()),
  ];
}
