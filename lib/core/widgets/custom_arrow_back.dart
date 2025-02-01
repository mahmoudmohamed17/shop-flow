import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/assets.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: borderFillColor),
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(
          Assets.imagesArrowLeft,
        ),
      ),
    );
  }
}
