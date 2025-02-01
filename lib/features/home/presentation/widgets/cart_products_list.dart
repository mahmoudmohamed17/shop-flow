import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';
import 'package:shop_flow/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:shop_flow/features/home/presentation/widgets/cart_product_item.dart';

class CartProductsList extends StatelessWidget {
  const CartProductsList({
    super.key,
    required this.products,
  });

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Slidable(
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    context.read<CartCubit>().removeProduct(products[index]);
                  },
                  backgroundColor: Colors.red,
                  icon: Icons.delete,
                  label: 'Delete',
                )
              ],
            ),
            child: CartProductItem(
              product: products[index],
            ),
          ),
        );
      },
    );
  }
}
