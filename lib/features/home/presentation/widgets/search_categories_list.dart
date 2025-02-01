import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/home/data/models/category_model.dart';
import 'package:shop_flow/features/home/presentation/widgets/search_category_item.dart';

class SearchCategoriesList extends StatelessWidget {
  const SearchCategoriesList({super.key});
  static final List<CategoryModel> categories = [
    CategoryModel(image: Assets.imagesBeauty, title: 'Beauty'),
    CategoryModel(image: Assets.imagesPerfumes, title: 'Perfumes'),
    CategoryModel(image: Assets.imagesFurniture, title: 'Furniture'),
    CategoryModel(image: Assets.imagesGroceries, title: 'Groceries'),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(categories.length, (index) {
        return Padding(
          padding: EdgeInsets.only(bottom: index == 4 ? 0 : 8),
          child: SearchCategoryItem(
            model: categories[index],
          ),
        );
      }),
    );
  }
}
