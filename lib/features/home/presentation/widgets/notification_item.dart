import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/extensions/context_extension.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/home/data/models/notification_model.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.model});
  final NotificationModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: borderFillColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        spacing: 20,
        children: [
          SvgPicture.asset(
            Assets.imagesNotificationItemIcon,
            height: 24,
            width: 24,
          ),
          SizedBox(
            width: context.width * 0.65,
            child: Text(
              model.message,
              textAlign: TextAlign.left,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.medium12,
            ),
          ),
        ],
      ),
    );
  }
}
