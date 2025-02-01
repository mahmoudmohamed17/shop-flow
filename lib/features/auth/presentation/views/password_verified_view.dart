import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/core/widgets/custom_button.dart';
import 'package:shop_flow/features/auth/presentation/views/signin_view.dart';

class PasswordVerifiedView extends StatelessWidget {
  const PasswordVerifiedView({super.key});
  static const String id = 'passwrod_verified_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 24,
            children: [
              Image.asset(Assets.imagesSendEmail),
              Text(
                textAlign: TextAlign.center,
                'We Sent you an Email to reset your password.',
                style: AppStyles.medium24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    label: 'Return to Login',
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, SigninView.id);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
