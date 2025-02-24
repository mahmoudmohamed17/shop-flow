import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/core/funcs/snack_bar.dart';
import 'package:shop_flow/core/utils/app_colors.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';
import 'package:shop_flow/features/home/presentation/manager/cart_cubit/cart_cubit.dart';

class CustomCartCheckoutButton extends StatelessWidget {
  const CustomCartCheckoutButton({
    super.key,
    required this.product,
  });

  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            log('Product ${product.id} has the following data:\n${product.toString()}');
            if (product.isAddedToCart) {
              context.read<CartCubit>().removeProduct(product);
              snackBar(context, 'Product removed from Cart.');
            } else {
              context.read<CartCubit>().addProduct(product);
              snackBar(context, 'Product added to Cart!');
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color:
                  product.isAddedToCart ? Colors.red : AppColors.primaryColor,
              borderRadius: BorderRadius.circular(100),
            ),
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  r'$'
                  '${(product.price * product.quantity).toStringAsFixed(2)}',
                  style: AppStyles.bold16.copyWith(color: Colors.white),
                ),
                Text(product.isAddedToCart ? 'Remove form Cart' : 'Add to Cart',
                    style: AppStyles.regular16.copyWith(color: Colors.white)),
              ],
            ),
          ),
        );
      },
    );
  }
}
