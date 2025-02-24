import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/services/shared_prefs.dart';
import 'package:shop_flow/features/auth/presentation/views/signin_view.dart';
import 'package:shop_flow/features/onboard/presentation/views/onboard_view.dart';
import 'package:shop_flow/main_view.dart';

String checkInitialRoute() {
  return SharedPrefs.getBool(isOnboardedSeen)
      ? SharedPrefs.getBool(isLoggedInOrSignedUp)
          ? MainView.id
          : SigninView.id
      : OnboardView.id;
}
