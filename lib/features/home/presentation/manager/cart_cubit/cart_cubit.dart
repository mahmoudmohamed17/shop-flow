import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:shop_flow/core/funcs/get_it_service.dart';
import 'package:shop_flow/core/funcs/save_product_state.dart';
import 'package:shop_flow/core/services/app_database.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<ProductEntity> products = [];
  final database = getIt<AppDatabase>();
  double total = 0.0;

  // msut be called when app starts
  Future<void> getProductsFromDatabase() async {
    emit(CartLoading());
    products = await database.getAllCartProducts();
    emitCartState();
  }

  Future<void> addProduct(ProductEntity product) async {
    emit(CartLoading());
    products.add(product);
    total += (product.price * product.quantity);
    product.isAddedToCart = true;
    saveProductStateAndTable(product);
  }

  Future<void> removeProduct(ProductEntity product) async {
    emit(CartLoading());
    products.remove(product);
    total -= (product.quantity * product.price);
    product.isAddedToCart = false;
    product.quantity = 1;
    saveProductStateAndTable(product);
  }

  Future<void> removeAllProducts() async {
    emit(CartLoading());
    resetProductsState();
    products.clear();
    total = 0.0;
    await saveProductsToDatabase();
    emitCartState();
  }

  Future<void> resetProductsState() async {
    await Future.wait(products.map((product) {
      product.isAddedToCart = false;
      product.quantity = 1;
      return saveProductState(product);
    }));
  }

  Future<void> update(ProductEntity product) async {
    final index = products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      products[index] = product;
      await saveProductStateAndTable(product);
    } else {
      log('The product is not found.');
    }
  }

  Future<void> incrementProduct(ProductEntity product) async {
    product.quantity++;
    products.contains(product) ? total += product.price : {};
    saveProductStateAndTable(product);
  }

  Future<void> decrementProduct(ProductEntity product) async {
    if (product.quantity > 1) {
      product.quantity--;
      products.contains(product) ? total -= product.price : {};
      saveProductStateAndTable(product);
    } else {}
  }

  void getTotal() {
    if (products.isEmpty) {
      emit(CartInitial());
    } else {
      for (var product in products) {
        total += (product.quantity * product.price);
      }
      emit(CartFilled(products: List.unmodifiable(products)));
    }
  }

  Future<void> saveProductStateAndTable(ProductEntity product) async {
    await Future.wait({
      saveProductState(product),
      saveProductsToDatabase(),
    });
    emitCartState();
  }

  Future<void> placeOrder() async {
    emit(CartLoading());
    await Future.delayed(const Duration(seconds: 3), () {});
    emitCartState();
  }

  Future<void> saveProductsToDatabase() async {
    await database.updateCartProducts(products);
  }

  void emitCartState() {
    if (products.isEmpty) {
      emit(CartInitial());
    } else {
      emit(CartFilled(products: List.unmodifiable(products)));
    }
  }
}
