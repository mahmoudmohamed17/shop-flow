import 'package:bloc/bloc.dart';
import 'package:shop_flow/features/orders/data/models/order_item_model.dart';
part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());
  List<OrderItemModel> orders = [];
  void addOrder(OrderItemModel order) {
    emit(OrdersLoading());
    orders.add(order);
    emitOrdersState();
  }

  void deleteOrder(OrderItemModel order) {
    emit(OrdersLoading());
    orders.remove(order);
    emitOrdersState();
  }

  void emitOrdersState() {
    if (orders.isEmpty) {
      emit(OrdersInitial());
    } else {
      emit(OrdersFilled(orders: List.unmodifiable(orders)));
    }
  }
}
