import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/widgets/custom_arrow_back.dart';
import 'package:shop_flow/core/widgets/custom_button.dart';
import 'package:shop_flow/core/widgets/custom_text_form_field.dart';
import 'package:shop_flow/features/auth/presentation/views/password_verified_view.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            CustomArrowBack(),
            Text(
              'Forgot Password',
              style: AppStyles.bold32,
            ),
            SizedBox(
              height: 5,
            ),
            CustomTextField(hintText: 'Enter Email Address'),
            Row(
              children: [
                Expanded(
                    child: CustomButton(
                  label: 'Continue',
                  onPressed: () {
                    Navigator.pushNamed(context, PasswordVerifiedView.id);
                  },
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
