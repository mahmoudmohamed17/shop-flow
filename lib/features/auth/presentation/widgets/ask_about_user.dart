import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_styles.dart';

class AskAboutUser extends StatelessWidget {
  const AskAboutUser({
    super.key,
    required this.firstLabel,
    required this.secondLabel,
    this.onTap,
  });
  final String firstLabel;
  final String secondLabel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        Text(
          firstLabel,
          style: AppStyles.medium12,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            secondLabel,
            style: AppStyles.bold12,
          ),
        ),
      ],
    );
  }
}
