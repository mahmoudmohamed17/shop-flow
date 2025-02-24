import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/services/shared_prefs.dart';
import 'package:shop_flow/features/home/data/models/firestore_user_data.dart';

Future<void> addDataToFirestore(FirestoreUserData data) async {
     var users =
        FirebaseFirestore.instance.collection(userData);
    await users.add({
      'username': data.username,
      'email': data.email,
      'password': data.password,
      'profileImage': data.profileImage,
      'phoneNumber': data.phoneNumber,
    }).then((value) async {
      await SharedPrefs.setString(userDocRefId, value.id);
    });
  }