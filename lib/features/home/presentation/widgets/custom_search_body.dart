import 'package:flutter/material.dart';
import 'package:shop_flow/core/extensions/context_extension.dart';
import 'package:shop_flow/core/funcs/get_products_by_category.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';
import 'package:shop_flow/features/home/presentation/widgets/custom_search_button.dart';
import 'package:shop_flow/core/widgets/empty_view_body.dart';
import 'package:shop_flow/features/home/presentation/widgets/search_results_body.dart';

class CustomSearchBody extends StatelessWidget {
  const CustomSearchBody({
    super.key,
  });

  static List<ProductEntity> products = [];

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
        isFullScreen: true,
        viewHintText: 'Search',
        dividerColor: Colors.transparent,
        viewBackgroundColor: Colors.white,
        builder: (context, contoller) {
          products = getProductsByCategory('');
          return CustomSearchButton(onTap: () {
            contoller.openView();
          });
        },
        suggestionsBuilder: (context, cotroller) {
          final query = cotroller.text;
          final results = products
              .where((product) =>
                  product.title.toLowerCase().contains(query.toLowerCase()))
              .toList();
          if (cotroller.text.isEmpty) {
            return [];
          } else {
            if (results.isNotEmpty) {
              return [
                SearchResultsBody(results: results),
              ];
            } else {
              return [
                SizedBox(
                  height: context.height * 0.20,
                ),
                EmptyViewBody(
                  images: Assets.imagesSearchNotFound,
                  title:
                      'Sorry, we couldn\'t find any matching result for your Search.',
                ),
              ];
            }
          }
        });
  }
}
