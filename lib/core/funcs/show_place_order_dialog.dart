import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/services/firebase_api.dart';
import 'package:shop_flow/core/services/shared_prefs.dart';
import 'package:shop_flow/core/utils/app_colors.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/main_view.dart';

Future<dynamic> showPlaceOrderDialog(BuildContext context, int orderNumber) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'Order Placed Successfully!',
            textAlign: TextAlign.center,
            style: AppStyles.regular16,
          ),
          contentPadding: EdgeInsets.all(8),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, MainView.id);
                FirebaseApi().sendLocalNotification(
                    title: 'Shop Flow',
                    body:
                        '${SharedPrefs.getString(userName)}, your order #$orderNumber has been confirmed, check your orders history for full details.');
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                backgroundColor: AppColors.primaryColor,
              ),
              child: Text(
                'Close',
                style: AppStyles.regular16.copyWith(color: Colors.white),
              ),
            ),
          ],
        );
      });
}
