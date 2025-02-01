import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';

class ProductConverter extends TypeConverter<ProductEntity, String> {
  // read
  @override
  ProductEntity fromSql(String fromDb) {
    return ProductEntity.fromJson(
        Map<String, dynamic>.from(jsonDecode(fromDb)));
  }

  // write
  @override
  String toSql(ProductEntity value) {
    return jsonEncode(
        value.toJson()); // the appropriate way to write to the database
  }
}
