import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/core/funcs/load_product_state.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/core/widgets/custom_cart_checkout_button.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';
import 'package:shop_flow/features/home/presentation/widgets/custom_heart_widget.dart';
import 'package:shop_flow/features/home/presentation/widgets/product_details_list.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      loadProductState(productEntity);
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(Assets.imagesBackgroundArrowBack)),
                CustomHeartWidget(
                  product: productEntity,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Expanded(
              child: ProductDetailsList(
            productEntity: productEntity,
          )),
          CustomCartCheckoutButton(
            product: productEntity,
          ),
        ],
      ),
    );
  }
}
