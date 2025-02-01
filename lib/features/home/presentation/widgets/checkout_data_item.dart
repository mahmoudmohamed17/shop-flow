import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/home/data/models/checkout_data_item_model.dart';

class CheckoutDataItem extends StatelessWidget {
  const CheckoutDataItem({super.key, required this.model});
  final CheckoutDataItemModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: borderFillColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(8),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          model.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.medium12.copyWith(color: subTextColor),
        ),
        subtitle: Text(
          model.subTitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.regular16,
        ),
        trailing: SvgPicture.asset(
          Assets.imagesArrowRight,
          height: 24,
          width: 24,
        ),
      ),
    );
  }
}
