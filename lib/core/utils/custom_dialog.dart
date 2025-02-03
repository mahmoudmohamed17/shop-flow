import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/services/shared_prefs.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/features/auth/presentation/views/signin_view.dart';

Future<dynamic> customDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'Are you sure to leave?',
            style: AppStyles.regular16,
          ),
          contentPadding: EdgeInsets.all(8),
          icon: Icon(
            Icons.logout,
            size: 24,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, SigninView.id);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.red,
              ),
              child: Text(
                'Sign out',
                style: AppStyles.regular16.copyWith(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                SharedPrefs.setBool(isLoggedInOrSignedUp, false);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.green,
              ),
              child: Text(
                'Stay in',
                style: AppStyles.regular16.copyWith(color: Colors.white),
              ),
            ),
          ],
        );
      });
}
