part of 'orders_cubit.dart';

class OrdersState {}

final class OrdersInitial extends OrdersState {}

final class OrdersLoading extends OrdersState {}

final class OrdersFilled extends OrdersState {
  final List<OrderItemModel> orders;

  OrdersFilled({required this.orders});
}
