import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/funcs/generate_random_number.dart';
import 'package:shop_flow/core/services/firebase_api.dart';
import 'package:shop_flow/core/services/shared_prefs.dart';
import 'package:shop_flow/features/home/data/models/notification_model.dart';
import 'package:shop_flow/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:shop_flow/features/home/presentation/manager/notifications_cubit/notifications_cubit.dart';
import 'package:shop_flow/features/orders/data/models/order_item_model.dart';
import 'package:shop_flow/features/orders/presentation/manager/cubit/orders_cubit.dart';

void handleAfterPaymentProcess(BuildContext context) {
  int ordersCount = context.read<CartCubit>().products.length;
  int orderNumber = generateRandomNumber();
  var order = OrderItemModel(itemsCount: ordersCount, orderNumber: orderNumber);
  context.read<OrdersCubit>().addOrder(order);
  var notificationMsg =
      'Dear ${SharedPrefs.getString(userName)}, you have a new order with number #$orderNumber.';
  FirebaseApi()
      .sendLocalNotification(title: 'New checkout!', body: notificationMsg);
  var notification =
      NotificationModel(message: notificationMsg, orderId: orderNumber);
  context.read<NotificationsCubit>().addNotification(notification);
  Navigator.pop(context);
  context.read<CartCubit>().removeAllProducts();
}
