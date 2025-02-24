import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/services/shared_prefs.dart';
import 'package:shop_flow/features/home/data/models/firestore_user_data.dart';

class UserDataManager {
  static late FirestoreUserData model;

  static Future<void> getUserData() async {
    FirebaseFirestore.instance
        .collection(userData)
        .doc(SharedPrefs.getString(userDocRefId))
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        model = FirestoreUserData.formJson(
            documentSnapshot.data() as Map<String, dynamic>);
      } else {
        debugPrint('Document does not exist on the database');
      }
    });
  }
}
