import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/presentation/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const String id = 'cart_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CartViewBody(),
    );
  }
}
