import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';

Future<void> saveProductState(ProductEntity product) async {
  final prefs = await SharedPreferences.getInstance();
  final int id = product.id;
  Future.wait([
    prefs.setInt('${id}_quantity', product.quantity),
    prefs.setBool('${id}_isAddedToWhishlist', product.isAddedToFavorites),
    prefs.setBool('${id}_isAddedToCart', product.isAddedToCart),
  ]);
}
