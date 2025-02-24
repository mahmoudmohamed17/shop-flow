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
      username: json['username'],
      email: json['email'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      profileImage: json['profileImage'],
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
