import 'package:shop_flow/core/funcs/categorize_products.dart';
import 'package:shop_flow/core/funcs/load_product_state.dart';
import 'package:shop_flow/core/utils/products_categorizable.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';

// make the essential processes to make products ready to be shown
Future<void> setupProducts(List<ProductEntity> products) async {
  await Future.wait(products.map((product) async {
    categorizeProducts(products);
    ProductsCategorizable.getAllProductsFromDatabase();
    loadProductState(product);
  }));
}
