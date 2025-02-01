import 'package:shop_flow/core/utils/products_categorizable.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';

List<ProductEntity> getProductsByCategory(String category) {
  List<ProductEntity> products = [];
  String id = category.toLowerCase();
  if (id == 'beauty') {
    products = ProductsCategorizable.beautyProducts;
  } else if (id == 'perfumes') {
    products = ProductsCategorizable.perfumesProducts;
  } else if (id == 'furniture') {
    products = ProductsCategorizable.furnituresProducts;
  } else if (id == 'groceries') {
    products = ProductsCategorizable.groceriesProducts;
  } else {
    products = ProductsCategorizable.allProducts;
  }
  return products;
}
