import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/funcs/build_border.dart';
import 'package:shop_flow/core/utils/app_styles.dart';

class CustomPasswordTextFormField extends StatefulWidget {
  const CustomPasswordTextFormField(
      {super.key,
      required this.hintText,
      this.onFieldSubmitted,
      this.onChanged});

  final String hintText;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;

  @override
  State<CustomPasswordTextFormField> createState() =>
      _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState
    extends State<CustomPasswordTextFormField> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyles.regular16,
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: widget.onChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return '${widget.hintText} is required';
        } else {
          return null;
        }
      },
      obscureText: isVisible,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppStyles.regular16.copyWith(color: borderHintTextColor),
        fillColor: borderFillColor,
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isVisible ? isVisible = false : isVisible = true;
              });
            },
            icon: Icon(
              isVisible ? Icons.visibility_off : Icons.visibility,
              color: Colors.black,
            )),
        contentPadding: EdgeInsets.all(12),
        filled: true,
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }
}
