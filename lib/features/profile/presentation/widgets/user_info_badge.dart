import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/services/shared_prefs.dart';
import 'package:shop_flow/core/utils/app_colors.dart';
import 'package:shop_flow/core/utils/app_styles.dart';

class UserInfoBadge extends StatelessWidget {
  const UserInfoBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: borderFillColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            SharedPrefs.getString(userName),
            style: AppStyles.bold16,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              SharedPrefs.getString(userEmail),
              style: AppStyles.regular16.copyWith(color: subTextColor),
            ),
            subtitle: Text(
              SharedPrefs.getString(phoneNumber),
              style: AppStyles.regular16.copyWith(color: subTextColor),
            ),
            trailing: Text(
              'Edit',
              style: AppStyles.bold12.copyWith(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
