import 'package:bloc/bloc.dart';
import 'package:shop_flow/core/funcs/get_it_service.dart';
import 'package:shop_flow/core/funcs/load_product_state.dart';
import 'package:shop_flow/core/funcs/save_product_state.dart';
import 'package:shop_flow/core/services/app_database.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  List<ProductEntity> products = [];
  final database = getIt<AppDatabase>();

  Future<void> addToFavorites(ProductEntity product) async {
    emit(FavoritesLoading());
    products.add(product);
    product.isAddedToFavorites = true;
    await saveState(product);
  }

  Future<void> deleteFromFavorite(ProductEntity product) async {
    emit(FavoritesLoading());
    products.remove(product);
    product.isAddedToFavorites = false;
    await saveState(product);
  }

  Future<void> updateFavorites() async {
    await database.updateFavorites(products);
  }

  Future<void> getFavorites() async {
    emit(FavoritesLoading());
    products = await database.getAllFavorites();
    emitFavoritesState();
  }

  Future<void> saveState(ProductEntity product) async {
    await Future.wait([
      saveProductState(product),
      loadProductState(product),
      updateFavorites(),
    ]);
    emitFavoritesState();
  }

  void emitFavoritesState() {
    if (products.isEmpty) {
      emit(FavoritesInitial());
    } else {
      emit(FavoritesFilled(products: List.unmodifiable(products)));
    }
  }
}
