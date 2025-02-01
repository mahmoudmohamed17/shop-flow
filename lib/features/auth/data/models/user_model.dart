import 'package:shop_flow/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.email, required super.name});
  factory UserModel.fromFirebase(user) {
    return UserModel(email: user.email, name: user.displayName ?? '');
  }
}
