import 'package:bloc/bloc.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';
import 'package:shop_flow/features/home/domain/repositories/home_repo.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.homeRepo) : super(ProductsInitial());
  final HomeRepo homeRepo;
  List<ProductEntity> topSellingProducts = [];
  List<ProductEntity> newInProducts = [];

  Future<void> getTopSellingProducts() async {
    emit(ProductsLoading());
    var result = await homeRepo.getTopSellingProducts();
    result.fold((failure) {
      emit(ProductsFailure(message: failure.message));
    }, (products) {
      topSellingProducts = products;
      emit(ProductsSuccess(products: products));
    });
  }

  Future<void> getNewInProducts() async {
    emit(ProductsLoading());
    var result = await homeRepo.getNewInProducts();
    result.fold((failure) {
      emit(ProductsFailure(message: failure.message));
    }, (products) {
      newInProducts = products;
      emit(ProductsSuccess(products: products));
    });
  }
}
