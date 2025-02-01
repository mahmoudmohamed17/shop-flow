import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_styles.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key, this.onPressed, required this.label, required this.icon});
  final void Function()? onPressed;
  final String label;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: borderFillColor,
          elevation: 0,
          padding: const EdgeInsets.all(8),
          shadowColor: Colors.transparent),
      child: ListTile(
          visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
          leading: Image.asset(icon),
          title: Text(
            label,
            textAlign: TextAlign.center,
            style: AppStyles.medium16,
          )),
    );
  }
}
