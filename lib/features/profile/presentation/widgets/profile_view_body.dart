import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/custom_dialog.dart';
import 'package:shop_flow/core/utils/user_data_manager.dart';
import 'package:shop_flow/features/home/data/models/firestore_user_data.dart';
import 'package:shop_flow/features/profile/presentation/widgets/user_info_badge.dart';
import 'package:shop_flow/features/profile/presentation/widgets/user_settings_options_widget.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});
  static FirestoreUserData data = UserDataManager.model;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 75,
                backgroundImage: FileImage(File(data.profileImage)),
              ),
              SizedBox(
                height: 24,
              ),
              UserInfoBadge(data: FirestoreUserData.formJson(data),),
              SizedBox(
                height: 24,
              ),
              UserSettingsOptionsWidgt(),
              SizedBox(
                height: 32,
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    customDialog(context);
                  },
                  child: Text(
                    'Sign Out',
                    style: AppStyles.bold16.copyWith(color: Color(0xffFA3636)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
