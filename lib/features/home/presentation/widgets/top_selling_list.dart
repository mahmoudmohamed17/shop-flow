import 'package:flutter/material.dart';
import 'package:shop_flow/core/funcs/load_product_state.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';
import 'package:shop_flow/features/home/presentation/widgets/product_item.dart';

class TopSellingList extends StatelessWidget {
  const TopSellingList({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          loadProductState(products[index]);
          return Padding(
            padding:
                EdgeInsets.only(right: index == products.length - 1 ? 0 : 12),
            child: ProductItem(productEntity: products[index]),
          );
        },
      ),
    );
  }
}
