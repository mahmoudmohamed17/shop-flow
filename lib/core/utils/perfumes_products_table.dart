import 'package:drift/drift.dart';
import 'package:shop_flow/core/utils/product_converter.dart';

class PerfumesProductsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get product => text().map(ProductConverter())();
}
