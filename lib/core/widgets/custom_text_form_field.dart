import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/funcs/build_border.dart';
import 'package:shop_flow/core/utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.onFieldSubmitted,
    this.onChanged,
    this.textInputType = TextInputType.text,
  });
  final String hintText;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyles.regular16,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return '$hintText is required';
        } else {
          return null;
        }
      },
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyles.regular16.copyWith(color: borderHintTextColor),
        fillColor: borderFillColor,
        contentPadding: EdgeInsets.all(12),
        filled: true,
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }
}
