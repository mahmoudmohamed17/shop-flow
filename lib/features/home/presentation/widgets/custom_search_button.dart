import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';

class CustomSearchButton extends StatelessWidget {
  const CustomSearchButton({
    super.key, required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: borderFillColor,
          borderRadius: BorderRadius.circular(100),
        ),
        padding: EdgeInsets.all(12),
        child: Row(
          spacing: 16,
          children: [
            SvgPicture.asset(Assets.imagesSearch),
            Text(
              'Search',
              style: AppStyles.regular12,
            )
          ],
        ),
      ),
    );
  }
}
