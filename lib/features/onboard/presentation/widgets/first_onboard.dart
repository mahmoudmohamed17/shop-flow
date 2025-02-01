import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';

class FirstOnboard extends StatelessWidget {
  const FirstOnboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      children: [
        SvgPicture.asset(Assets.imagesGirlShoppingOnboard),
        Text(
          textAlign: TextAlign.center,
          'Everything you need in one place',
          style: AppStyles.bold24,
        ),
        Text(
          textAlign: TextAlign.center,
          'Shop a wide range of products from top brands at competitive prices.',
          style: AppStyles.regular16,
        ),
      ],
    );
  }
}
