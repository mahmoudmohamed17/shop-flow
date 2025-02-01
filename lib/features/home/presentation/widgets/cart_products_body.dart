import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';
import 'package:shop_flow/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:shop_flow/features/home/presentation/widgets/cart_checkout_widget.dart';
import 'package:shop_flow/features/home/presentation/widgets/cart_products_list.dart';
import 'package:shop_flow/core/widgets/custom_app_bar.dart';

class CartProductsBody extends StatelessWidget {
  const CartProductsBody({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        CustomAppBar(
          title: 'Cart',
        ),
        SizedBox(
          height: 34,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                context.read<CartCubit>().removeAllProducts();
              },
              child: Text(
                'Remove All',
                style: AppStyles.regular16,
              ),
            )
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: CartProductsList(products: products),
        ),
        SizedBox(
          height: 16,
        ),
        CartCheckoutWidget(),
      ],
    );
  }
}
