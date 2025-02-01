import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/features/home/presentation/views/categories_search_view.dart';
import 'package:shop_flow/features/home/presentation/widgets/categories_list.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
              style: AppStyles.bold16,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, CategoriesSearchView.id);
              },
              child: Text(
                'See All',
                style: AppStyles.regular16,
              ),
            ),
          ],
        ),
        CategoriesList(),
      ],
    );
  }
}
