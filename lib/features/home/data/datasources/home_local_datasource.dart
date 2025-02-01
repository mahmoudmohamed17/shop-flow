import 'package:shop_flow/core/funcs/get_it_service.dart';
import 'package:shop_flow/core/services/app_database.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';

abstract class HomeLocalDatasource {
  Future<List<ProductEntity>> getTopSellingProducts();
  Future<List<ProductEntity>> getNewInProducts();
}

class HomeLocalDatasourceImpl extends HomeLocalDatasource {
  @override
  Future<List<ProductEntity>> getNewInProducts() async {
    final database = getIt<AppDatabase>();
    List<ProductEntity> products = await database.getAllProducts();
    List<ProductEntity> result = [];
    for (int i = 15; i < products.length; i++) {
      result.add(products[i]);
    }
    return result;
  }

  @override
  Future<List<ProductEntity>> getTopSellingProducts() async {
    final database = getIt<AppDatabase>();
    List<ProductEntity> products = await database.getAllProducts();
    List<ProductEntity> result = [];
    for (int i = 0; i < products.length / 2; i++) {
      result.add(products[i]);
    }
    return result;
  }
}
