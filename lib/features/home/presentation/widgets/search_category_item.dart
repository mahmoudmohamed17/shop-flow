import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/funcs/load_product_state.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/features/home/data/models/category_model.dart';
import 'package:shop_flow/features/home/presentation/views/category_details_view.dart';

class SearchCategoryItem extends StatelessWidget {
  const SearchCategoryItem({super.key, required this.model});
  final CategoryModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        for (var product in model.products) {
          loadProductState(product);
        }
        Navigator.pushNamed(context, CategoryDetailsView.id, arguments: model);
      },
      child: Container(
        decoration: BoxDecoration(
            color: borderFillColor, borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.all(12),
        child: ListTile(
          leading: Image.asset(model.image),
          title: Text(
            model.title,
            style: AppStyles.regular16,
          ),
        ),
      ),
    );
  }
}
