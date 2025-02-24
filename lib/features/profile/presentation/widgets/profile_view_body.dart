import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/funcs/snack_bar.dart';
import 'package:shop_flow/core/services/shared_prefs.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/custom_dialog.dart';
import 'package:shop_flow/features/home/data/models/firestore_user_data.dart';
import 'package:shop_flow/features/profile/presentation/widgets/user_info_badge.dart';
import 'package:shop_flow/features/profile/presentation/widgets/user_settings_options_widget.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  Map<String, dynamic> data = {};

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection(userData)
        .doc(SharedPrefs.getString(userDocRefId))
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        data = documentSnapshot.data() as Map<String, dynamic>;
      } else {
        snackBar(context, 'Document does not exist on the database');
      }
    });
    super.initState();
  }

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
                backgroundImage: FileImage(File(data['profileImage'])),
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
