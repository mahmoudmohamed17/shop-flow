import 'package:flutter/material.dart';
import 'package:shop_flow/core/extensions/context_extension.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/home/data/models/category_model.dart';
import 'package:shop_flow/features/home/presentation/widgets/category_item.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  static final List<CategoryModel> categories = [
    CategoryModel(image: Assets.imagesBeauty, title: 'Beauty'),
    CategoryModel(image: Assets.imagesPerfumes, title: 'Perfumes'),
    CategoryModel(image: Assets.imagesFurniture, title: 'Furniture'),
    CategoryModel(image: Assets.imagesGroceries, title: 'Groceries'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.13,
      child: ListView.builder(
          itemCount: categories.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: index == 4 ? 0 : 12),
              child: CategoryItem(
                model: categories[index],
              ),
            );
          }),
    );
  }
}
