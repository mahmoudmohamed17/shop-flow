import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/features/home/data/models/notification_model.dart';
import 'package:shop_flow/features/home/presentation/manager/notifications_cubit/notifications_cubit.dart';
import 'package:shop_flow/features/home/presentation/widgets/notification_item.dart';

class NotificationsFilledBody extends StatelessWidget {
  const NotificationsFilledBody({super.key, required this.notifications});
  final List<NotificationModel> notifications;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SafeArea(
        child: Column(
          spacing: 16,
          children: [
            SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Notifications',
                  style: AppStyles.bold16,
                ),
              ],
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Slidable(
                            startActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      context
                                          .read<NotificationsCubit>()
                                          .deleteNotification(
                                            notifications[index],
                                          );
                                    },
                                    icon: Icons.delete,
                                    backgroundColor: Colors.red,
                                    label: 'Delete',
                                  ),
                                ]),
                            child:
                                NotificationItem(model: notifications[index])),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
