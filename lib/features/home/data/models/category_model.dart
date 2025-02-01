import 'dart:developer';

import 'package:shop_flow/core/funcs/get_products_by_category.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';

class CategoryModel {
  final String image;
  final String title;
  late List<ProductEntity> products;

  CategoryModel({required this.image, required this.title}) {
    products = getProductsByCategory(title);
    log('Products of $title have ${products.length}');
  }
}
