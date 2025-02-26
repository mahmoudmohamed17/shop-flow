import 'package:shop_flow/core/utils/assets.dart';

class FirestoreUserData {
  final String username;
  final String email;
  final String password;
  final String phoneNumber;
  final String profileImage;

  FirestoreUserData(
      {required this.username,
      required this.email,
      required this.password,
      required this.phoneNumber,
      required this.profileImage});

  factory FirestoreUserData.formJson(json) {
    return FirestoreUserData(
      username: json?['username'] ?? 'USERNAME',
      email: json?['email'] ?? 'EMAIL',
      password: json?['password'] ?? 'PASSWORD',
      phoneNumber: json?['phoneNumber'] ?? 'PHONE NUMBER',
      profileImage: json?['profileImage'] ?? Assets.imagesProfile,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'profileImage': profileImage,
    };
  }
}
