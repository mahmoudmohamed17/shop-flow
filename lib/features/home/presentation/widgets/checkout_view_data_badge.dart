import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_styles.dart';

class CheckoutViewDataBadge extends StatelessWidget {
  const CheckoutViewDataBadge({super.key, required this.total});
  final double total;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',
              style: AppStyles.regular16.copyWith(color: subTextColor),
            ),
            Text(
              r'$' '${total.toStringAsFixed(2)}',
              style: AppStyles.medium16,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping Cost',
              style: AppStyles.regular16.copyWith(color: subTextColor),
            ),
            Text(
              r'$8.00',
              style: AppStyles.medium16,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: AppStyles.regular16.copyWith(color: subTextColor),
            ),
            Text(
              r'$'
              '${(total + 8.00).toStringAsFixed(2)}',
              style: AppStyles.bold16,
            ),
          ],
        ),
      ],
    );
  }
}
