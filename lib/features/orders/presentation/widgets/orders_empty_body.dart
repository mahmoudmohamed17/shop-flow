import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/core/widgets/empty_view_body.dart';

class OrdersEmptyBody extends StatelessWidget {
  const OrdersEmptyBody({super.key});

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
            Expanded(child: SizedBox()),
            Center(
                child: EmptyViewBody(
                    images: Assets.imagesOrdersEmpty, title: 'No Orders Yet')),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
