import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/features/orders/presentation/manager/cubit/orders_cubit.dart';
import 'package:shop_flow/features/orders/presentation/widgets/orders_empty_body.dart';
import 'package:shop_flow/features/orders/presentation/widgets/orders_filled_body.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(builder: (context, state) {
      if (state is OrdersInitial) {
        return OrdersEmptyBody();
      } else if (state is OrdersFilled) {
        return OrdersFilledBody(orders: state.orders);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
