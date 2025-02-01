import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';

class SecondOnboard extends StatelessWidget {
  const SecondOnboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      children: [
        SvgPicture.asset(Assets.imagesDiscountsOnboard),
        Text(
          textAlign: TextAlign.center,
          'Exclusive deals and amazing discounts',
          style: AppStyles.bold24,
        ),
        Text(
          textAlign: TextAlign.center,
          'Save more with special offers on all your needs.',
          style: AppStyles.regular16,
        ),
      ],
    );
  }
}
