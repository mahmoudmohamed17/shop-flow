import 'package:drift/drift.dart';
import 'package:shop_flow/core/utils/product_converter.dart';

class FavoritesProductTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get product => text().map(ProductConverter())();
}
