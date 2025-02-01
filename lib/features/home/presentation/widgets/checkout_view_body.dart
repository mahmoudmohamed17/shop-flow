import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/core/widgets/custom_app_bar.dart';
import 'package:shop_flow/features/home/data/models/checkout_data_item_model.dart';
import 'package:shop_flow/features/home/presentation/widgets/checkout_data_item.dart';
import 'package:shop_flow/features/home/presentation/widgets/checkout_place_order_widget.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key, required this.total});
  final double total;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            CustomAppBar(title: 'Checkout'),
            SizedBox(
              height: 34,
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CheckoutDataItem(
                        model: CheckoutDataItemModel(
                      title: 'Shipping Address',
                      subTitle: 'Minya, Egypt',
                    )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: borderFillColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(8),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Payment Method',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.medium12.copyWith(color: subTextColor),
                      ),
                      subtitle: Row(
                        spacing: 6,
                        children: [
                          Text(
                            '**** 4187',
                            style: AppStyles.regular16,
                          ),
                          SvgPicture.asset(
                            Assets.imagesMastercard,
                            height: 15,
                            width: 15,
                          ),
                        ],
                      ),
                      trailing: SvgPicture.asset(
                        Assets.imagesArrowRight,
                        height: 24,
                        width: 24,
                      ),
                    ),
                  )
                ],
              ),
            ),
            CheckoutPlaceOrderWidget(
              total: total,
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
