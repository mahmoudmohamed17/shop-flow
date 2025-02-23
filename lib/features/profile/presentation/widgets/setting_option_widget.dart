import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/profile/data/models/user_setting_option_model.dart';

class SettingOptionWidget extends StatelessWidget {
  const SettingOptionWidget({super.key, required this.model});
  final UserSettingOptionModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: model.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: borderFillColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              model.label,
              style: AppStyles.regular16,
            ),
            SvgPicture.asset(
              Assets.imagesArrowRight,
            ),
          ],
        ),
      ),
    );
  }
}
