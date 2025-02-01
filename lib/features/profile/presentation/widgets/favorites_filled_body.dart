import 'package:flutter/material.dart';
import 'package:shop_flow/core/widgets/custom_app_bar.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';
import 'package:shop_flow/features/home/presentation/widgets/product_item.dart';

class FavoritesFilledBody extends StatelessWidget {
  const FavoritesFilledBody({super.key, required this.products});
  final List<ProductEntity> products;
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
            CustomAppBar(title: 'Favorites(${products.length})'),
            SizedBox(
              height: 16,
            ),
            Expanded(
                child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.50),
                    itemBuilder: (context, index) {
                      return ProductItem(productEntity: products[index]);
                    })),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
