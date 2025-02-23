part of 'cart_cubit.dart';

class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartFilled extends CartState {
  final List<ProductEntity> products;

  CartFilled({required this.products});
}

final class ProductIcrement extends CartState {}

final class ProductDecrement extends CartState {}
