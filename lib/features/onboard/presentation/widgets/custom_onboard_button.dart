import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_styles.dart';

class CustomOnboardButton extends StatelessWidget {
  const CustomOnboardButton({
    super.key,
    required this.pageController,
    required this.currentIndex,
    this.onPressed,
    this.backgroundColor = Colors.white,
    required this.text,
    this.textColor = Colors.black,
  });

  final PageController pageController;
  final int currentIndex;
  final void Function()? onPressed;
  final Color backgroundColor;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            elevation: 0,
            shadowColor: Colors.transparent),
        child: Text(
          text,
          style: AppStyles.regular16.copyWith(color: textColor),
        ));
  }
}
