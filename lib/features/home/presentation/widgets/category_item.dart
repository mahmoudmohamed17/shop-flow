import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/funcs/load_product_state.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/features/home/data/models/category_model.dart';
import 'package:shop_flow/features/home/presentation/views/category_details_view.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.model});
  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        for (var product in model.products) {
          log('Load state of products ${model.products}');
          loadProductState(product);
        }
        Navigator.pushNamed(context, CategoryDetailsView.id, arguments: model);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 5,
        children: [
          Container(
              decoration: BoxDecoration(
                color: borderFillColor,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Image.asset(
                model.image,
                width: 70,
                height: 70,
              )),
          Text(
            model.title,
            style: AppStyles.regular12,
          )
        ],
      ),
    );
  }
}
