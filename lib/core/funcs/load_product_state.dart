import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';

Future<void> loadProductState(ProductEntity product) async {
  final prefs = await SharedPreferences.getInstance();
  final int id = product.id;
  log('Load state of Product $id, and its data {quantity: ${product.quantity}, isAddedToCart: ${product.isAddedToCart}, isAddedToWhishlist: ${product.isAddedToFavorites}}');
  product.quantity = prefs.getInt('${id}_quantity') ?? 1;
  product.isAddedToFavorites =
      prefs.getBool('${id}_isAddedToWhishlist') ?? false;
  product.isAddedToCart = prefs.getBool('${id}_isAddedToCart') ?? false;
}
