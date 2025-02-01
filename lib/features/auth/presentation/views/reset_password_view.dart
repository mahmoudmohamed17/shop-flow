import 'package:flutter/material.dart';
import 'package:shop_flow/features/auth/presentation/widgets/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});
  static const String id = 'reset_password_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ResetPasswordViewBody(),
    );
  }
}
