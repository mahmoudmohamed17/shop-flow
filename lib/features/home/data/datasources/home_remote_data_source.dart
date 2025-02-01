import 'package:shop_flow/core/funcs/get_products_list.dart';
import 'package:shop_flow/core/services/api_service.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductEntity>> getTopSellingProducts();
  Future<List<ProductEntity>> getNewInProducts();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService _apiService;
  HomeRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<ProductEntity>> getNewInProducts() async {
    var data = await _apiService.getProducts();
    List<ProductEntity> products = getProductsList(data);
    List<ProductEntity> result = [];
    for (int i = 15; i < products.length; i++) {
      result.add(products[i]);
    }
    return result;
  }

  @override
  Future<List<ProductEntity>> getTopSellingProducts() async {
    var data = await _apiService.getProducts();
    List<ProductEntity> products = getProductsList(data);
    List<ProductEntity> result = [];
    for (int i = 0; i < products.length / 2; i++) {
      result.add(products[i]);
    }
    return result;
  }
}
