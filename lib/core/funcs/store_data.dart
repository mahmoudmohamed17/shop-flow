import 'package:shop_flow/core/funcs/get_it_service.dart';
import 'package:shop_flow/core/services/app_database.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';

Future<void> storeData(List<ProductEntity> products) async {
  final database = getIt<AppDatabase>();
  await database.storeAllProducts(products);
}
