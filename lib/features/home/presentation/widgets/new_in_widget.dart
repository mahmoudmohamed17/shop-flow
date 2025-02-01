import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_colors.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/features/home/data/models/top_selling_new_in_model.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';
import 'package:shop_flow/features/home/presentation/views/top_selling_and_new_in_details_view.dart';
import 'package:shop_flow/features/home/presentation/widgets/top_selling_list.dart';

class NewInWidget extends StatelessWidget {
  const NewInWidget({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'New In',
              style: AppStyles.bold16.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, TopSellingAndNewInDetailsView.id,
                    arguments: TopSellingNewInModel(
                        label: 'New In', products: products));
              },
              child: Text(
                'See All',
                style: AppStyles.regular16,
              ),
            ),
          ],
        ),
        // Same UI as New In
        TopSellingList(
          products: products,
        ),
      ],
    );
  }
}
