import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/features/home/presentation/manager/notifications_cubit/notifications_cubit.dart';
import 'package:shop_flow/features/home/presentation/widgets/notifications_empty_body.dart';
import 'package:shop_flow/features/home/presentation/widgets/notifications_filled_body.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        if (state is NotificationsInitial) {
          return NotificationsEmptyBody();
        } else if (state is NotificationsFilled) {
          return NotificationsFilledBody(
            notifications: state.notifications,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
