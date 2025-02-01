import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/extensions/context_extension.dart';
import 'package:shop_flow/core/funcs/load_product_state.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';
import 'package:shop_flow/features/home/presentation/views/product_details_view.dart';
import 'package:shop_flow/features/home/presentation/widgets/increment_product_widget.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    log('The product ${product.id} has ${product.reviewsList.length} reviews\nAnd ${product.imagesList.length} images');
    return GestureDetector(
      onTap: () {
        loadProductState(product);
        Navigator.pushNamed(context, ProductDetailsView.id, arguments: product);
      },
      child: Container(
        constraints: BoxConstraints(
            maxHeight: context.height * 0.17, maxWidth: context.width),
        decoration: BoxDecoration(
          color: borderFillColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 8,
          children: [
            CachedNetworkImage(
              imageUrl: product.imagesList.isEmpty
                  ? Assets.imagesShoppingBag
                  : product.imagesList[0],
              height: context.height * 0.15,
              width: context.width * 0.15,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                color: Colors.red,
              ),
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                SizedBox(
                  width: context.width * 0.35,
                  child: Text(
                    product.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppStyles.regular12,
                  ),
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: 'Quantity ',
                    style: AppStyles.regular12.copyWith(color: subTextColor),
                  ),
                  TextSpan(
                    text: '- ',
                    style: AppStyles.regular12.copyWith(color: subTextColor),
                  ),
                  TextSpan(
                    text: '${product.quantity}',
                    style: AppStyles.bold12,
                  ),
                ]))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                Text(
                  r'$' '${product.price}',
                  style: AppStyles.bold12,
                ),
                IncrementProductWidget(
                  product: product,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
