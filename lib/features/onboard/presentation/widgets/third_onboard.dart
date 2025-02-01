import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';

class ThirdOnboard extends StatelessWidget {
  const ThirdOnboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      children: [
        SvgPicture.asset(Assets.imagesPaymentsOnboard),
        Text(
          textAlign: TextAlign.center,
          'Seamless and secure shopping experience',
          style: AppStyles.bold24,
        ),
        Text(
          textAlign: TextAlign.center,
          'Order your favorite items easily with safe payment options.',
          style: AppStyles.regular16,
        ),
      ],
    );
  }
}
