import 'package:shop_flow/features/home/data/models/product_model/product_model.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';

List<ProductEntity> getProductsList(Map<String, dynamic> data) {
  List<ProductEntity> products = [];
  for (Map<String, dynamic> product in data['products']) {
    products.add(ProductModel.fromJson(product));
  }
  return products;
}
