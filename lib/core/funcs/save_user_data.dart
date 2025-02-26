import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/services/shared_prefs.dart';

Future saveUserData(
      {required String name,
      required String email,
      required String phone,
      required String image}) async {
    await Future.wait([
      SharedPrefs.setString(userName, name),
      SharedPrefs.setString(userEmail, email),
      SharedPrefs.setString(phoneNumber, phone),
      SharedPrefs.setString(profileImage, image),
    ]);
  }