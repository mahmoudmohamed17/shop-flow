import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_colors.dart';
import 'package:shop_flow/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.label, this.onPressed, this.isLoading = false});
  final String label;
  final void Function()? onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Text(
                label,
                style: AppStyles.medium16.copyWith(color: Colors.white),
              ));
  }
}
