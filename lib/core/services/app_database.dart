// NOTE: This file would be used later in other projects

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:shop_flow/core/utils/beauty_products_table.dart';
import 'package:shop_flow/core/utils/cart_products_table.dart';
import 'package:shop_flow/core/utils/favorites_product_table.dart';
import 'package:shop_flow/core/utils/furnitures_products_table.dart';
import 'package:shop_flow/core/utils/groceries_products_table.dart';
import 'package:shop_flow/core/utils/perfumes_products_table.dart';
import 'package:shop_flow/core/utils/product_converter.dart';
import 'package:shop_flow/core/utils/products_table.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';
part 'app_database.g.dart';

@DriftDatabase(tables: [
  ProductsTable,
  BeautyProductsTable,
  PerfumesProductsTable,
  FurnituresProductsTable,
  GroceriesProductsTable,
  CartProductsTable,
  FavoritesProductTable,
])

class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> storeAllProducts(List<ProductEntity> products) async {
    await batch((batch) {
      batch.insertAll(
          productsTable,
          products
              .map((product) =>
                  ProductsTableData(id: product.id, product: product))
              .toList(),
          mode: InsertMode.insertOrIgnore);
    });
  }

  Future<List<ProductEntity>> getAllProducts() async {
    final query = await select(productsTable).get();
    final products = query.map((row) => row.product).toList();
    return products;
  }

  Future<void> categorizeAllProducts(List<ProductEntity> products) async {
    await batch((batch) {
      batch.insertAll(
          beautyProductsTable,
          products
              .where((product) => product.category == 'beauty')
              .map((product) =>
                  BeautyProductsTableData(id: product.id, product: product))
              .toList(),
          mode: InsertMode.insertOrIgnore);
      batch.insertAll(
          perfumesProductsTable,
          products
              .where((product) => product.category == 'fragrances')
              .map((product) =>
                  PerfumesProductsTableData(id: product.id, product: product))
              .toList(),
          mode: InsertMode.insertOrIgnore);
      batch.insertAll(
          furnituresProductsTable,
          products
              .where((product) => product.category == 'furniture')
              .map((product) =>
                  FurnituresProductsTableData(id: product.id, product: product))
              .toList(),
          mode: InsertMode.insertOrIgnore);
      batch.insertAll(
          groceriesProductsTable,
          products
              .where((product) => product.category == 'groceries')
              .map((product) =>
                  GroceriesProductsTableData(id: product.id, product: product))
              .toList(),
          mode: InsertMode.insertOrIgnore);
    });
  }

  Future<List<ProductEntity>> getAllBeautyProducts() async {
    final query = await select(beautyProductsTable).get();
    final products = query.map((row) => row.product).toList();
    return products;
  }

  Future<List<ProductEntity>> getAllPerfumesProducts() async {
    final query = await select(perfumesProductsTable).get();
    final products = query.map((row) => row.product).toList();
    return products;
  }

  Future<List<ProductEntity>> getAllFurnituresProducts() async {
    final query = await select(furnituresProductsTable).get();
    final products = query.map((row) => row.product).toList();
    return products;
  }

  Future<List<ProductEntity>> getAllGroceriesProducts() async {
    final query = await select(groceriesProductsTable).get();
    final products = query.map((row) => row.product).toList();
    return products;
  }

  Future<int> addProductToCart(ProductEntity product) async {
    return into(cartProductsTable)
        .insert(product as Insertable<CartProductsTableData>);
  }

  Future<List<ProductEntity>> getAllCartProducts() async {
    final query = await select(cartProductsTable).get();
    final products = query.map((row) => row.product).toList();
    return products;
  }

  Future<void> updateCartProducts(List<ProductEntity> products) async {
    await batch((batch) {
      products.isEmpty
          ? cartProductsTable.deleteAll()
          : batch.insertAll(
              cartProductsTable,
              products.map(
                (product) =>
                    CartProductsTableData(id: product.id, product: product),
              ),
              mode: InsertMode.insertOrIgnore);
    });
  }

  Future<int> addToFavorites(ProductEntity product) async {
    return into(favoritesProductTable)
        .insert(product as Insertable<FavoritesProductTableData>);
  }

  Future<List<ProductEntity>> getAllFavorites() async {
    final query = await select(favoritesProductTable).get();
    final products = query.map((row) => row.product).toList();
    return products;
  }

  Future<void> updateFavorites(List<ProductEntity> products) async {
    await batch((batch) {
      products.isEmpty
          ? favoritesProductTable.deleteAll()
          : batch.insertAll(
              favoritesProductTable,
              products.map(
                (product) =>
                    FavoritesProductTableData(id: product.id, product: product),
              ),
              mode: InsertMode.insertOrIgnore);
    });
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        // Note: By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
