import 'package:flutter/material.dart';
import 'package:shop_flow/core/extensions/context_extension.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';
import 'package:shop_flow/features/home/presentation/widgets/product_item.dart';

class SearchResultsBody extends StatelessWidget {
  const SearchResultsBody({
    super.key,
    required this.results,
  });

  final List<ProductEntity> results;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height,
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Text(
              '${results.length} Results Found',
              style: AppStyles.bold12,
            ),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.50),
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                children: results
                    .map((result) => ProductItem(productEntity: result))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}
