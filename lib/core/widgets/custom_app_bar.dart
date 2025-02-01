import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(Assets.imagesBackgroundArrowBack)),
        Expanded(child: SizedBox()),
        Text(
          title,
          style: AppStyles.bold16,
        ),
        Expanded(child: SizedBox()),
        Opacity(
            opacity: 0,
            child: SvgPicture.asset(Assets.imagesBackgroundArrowBack))
      ],
    );
  }
}
