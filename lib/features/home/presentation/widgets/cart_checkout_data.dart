import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/features/home/presentation/manager/cart_cubit/cart_cubit.dart';

class CartCheckoutData extends StatelessWidget {
  const CartCheckoutData({super.key});

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
              r'$' '${context.read<CartCubit>().total.toStringAsFixed(2)}',
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
              '${(context.read<CartCubit>().total + 8.00).toStringAsFixed(2)}',
              style: AppStyles.bold16,
            ),
          ],
        ),
      ],
    );
  }
}
