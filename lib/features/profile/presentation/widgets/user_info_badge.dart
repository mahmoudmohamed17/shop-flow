import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_colors.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/features/home/data/models/firestore_user_data.dart';

class UserInfoBadge extends StatelessWidget {
  const UserInfoBadge({super.key, required this.data});
  final FirestoreUserData data;

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
            data.username,
            style: AppStyles.bold16,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              data.email,
              style: AppStyles.regular16.copyWith(color: subTextColor),
            ),
            subtitle: Text(
              data.phoneNumber,
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
