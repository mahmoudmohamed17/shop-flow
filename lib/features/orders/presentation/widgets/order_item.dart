import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/orders/data/models/order_item_model.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.model});
  final OrderItemModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: borderFillColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(8),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: SvgPicture.asset(
            Assets.imagesReceipt,
            height: 24,
            width: 24,
          ),
          title: Text(
            'Order #${model.orderNumber.toString()}',
            style: AppStyles.medium16,
          ),
          subtitle: Text(
            '${model.itemsCount} Items',
            style: AppStyles.medium12.copyWith(color: subTextColor),
          ),
          trailing: SvgPicture.asset(
            Assets.imagesArrowRight,
            height: 24,
            width: 24,
          ),
        ),
      ),
    );
  }
}
