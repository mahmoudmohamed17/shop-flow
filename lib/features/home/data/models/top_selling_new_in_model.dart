import 'package:shop_flow/features/home/domain/entities/product_entity.dart';

class TopSellingNewInModel {
  final String label;
  final List<ProductEntity> products;

  TopSellingNewInModel({required this.label, required this.products});
}
