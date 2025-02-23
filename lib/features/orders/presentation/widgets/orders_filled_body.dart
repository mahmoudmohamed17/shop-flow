import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/services/firebase_api.dart';
import 'package:shop_flow/core/services/shared_prefs.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/features/home/data/models/notification_model.dart';
import 'package:shop_flow/features/home/presentation/manager/notifications_cubit/notifications_cubit.dart';
import 'package:shop_flow/features/orders/data/models/order_item_model.dart';
import 'package:shop_flow/features/orders/presentation/manager/cubit/orders_cubit.dart';
import 'package:shop_flow/features/orders/presentation/widgets/order_item.dart';

class OrdersFilledBody extends StatelessWidget {
  const OrdersFilledBody({super.key, required this.orders});
  final List<OrderItemModel> orders;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Orders',
                  style: AppStyles.bold16,
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return Slidable(
                  child: Slidable(
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (value) {
                            context
                                .read<OrdersCubit>()
                                .deleteOrder(orders[index]);
                            var message =
                                'Dear ${SharedPrefs.getString(userName)}, thank you for shopping with us, we have canceled order #${orders[index].orderNumber}';
                            var notificationModel = NotificationModel(
                                message: message,
                                orderId: orders[index].orderNumber);
                            context
                                .read<NotificationsCubit>()
                                .addNotification(notificationModel);
                            FirebaseApi().sendLocalNotification(
                                title: 'Shop Flow', body: message);
                          },
                          icon: Icons.delete,
                          backgroundColor: Colors.red,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: OrderItem(model: orders[index]),
                    ),
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
