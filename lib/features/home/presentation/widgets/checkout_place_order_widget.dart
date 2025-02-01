import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/funcs/generate_random_number.dart';
import 'package:shop_flow/core/funcs/show_place_order_dialog.dart';
import 'package:shop_flow/core/services/shared_prefs.dart';
import 'package:shop_flow/core/utils/app_colors.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/features/home/data/models/notification_model.dart';
import 'package:shop_flow/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:shop_flow/features/home/presentation/manager/notifications_cubit/notifications_cubit.dart';
import 'package:shop_flow/features/home/presentation/widgets/checkout_view_data_badge.dart';
import 'package:shop_flow/features/orders/data/models/order_item_model.dart';
import 'package:shop_flow/features/orders/presentation/manager/cubit/orders_cubit.dart';

class CheckoutPlaceOrderWidget extends StatelessWidget {
  const CheckoutPlaceOrderWidget({super.key, required this.total});
  final double total;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 75,
      children: [
        CheckoutViewDataBadge(total: total),
        ElevatedButton(
            onPressed: () async {
              int itemsCount = context.read<CartCubit>().products.length;
              int orderNumber = generateRandomNumber();
              await context.read<CartCubit>().placeOrder();
              // ignore: use_build_context_synchronously
              context.read<CartCubit>().removeAllProducts();
              // ignore: use_build_context_synchronously
              context.read<OrdersCubit>().addOrder(OrderItemModel(
                  orderNumber: orderNumber, itemsCount: itemsCount));
              final notificationBody =
                  '${SharedPrefs.getString(userName)}, your order #$orderNumber has been confirmed, check your orders history for full details.';
              // ignore: use_build_context_synchronously
              context.read<NotificationsCubit>().addNotification(
                  NotificationModel(
                      message: notificationBody, orderId: orderNumber));
              // ignore: use_build_context_synchronously
              showPlaceOrderDialog(context, orderNumber);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: EdgeInsets.all(16),
                elevation: 0,
                shadowColor: Colors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  r'$'
                  '${(total + 8.00).toStringAsFixed(2)}',
                  style: AppStyles.bold16.copyWith(color: Colors.white),
                ),
                Text(
                  'Place Order',
                  style: AppStyles.regular16.copyWith(color: Colors.white),
                )
              ],
            )),
      ],
    );
  }
}
