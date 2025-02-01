import 'package:shop_flow/core/funcs/get_it_service.dart';
import 'package:shop_flow/core/services/app_database.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';

class ProductsCategorizable {
  static List<ProductEntity> allProducts = [];
  static List<ProductEntity> beautyProducts = [];
  static List<ProductEntity> perfumesProducts = [];
  static List<ProductEntity> furnituresProducts = [];
  static List<ProductEntity> groceriesProducts = [];

  static Future<void> getAllProductsFromDatabase() async {
    final database = getIt<AppDatabase>();
    await Future.wait({
      database.getAllBeautyProducts().then((value) => beautyProducts = value),
      database
          .getAllPerfumesProducts()
          .then((value) => perfumesProducts = value),
      database
          .getAllFurnituresProducts()
          .then((value) => furnituresProducts = value),
      database
          .getAllGroceriesProducts()
          .then((value) => groceriesProducts = value),
      database.getAllProducts().then((value) => allProducts = value),
    });
  }
}
