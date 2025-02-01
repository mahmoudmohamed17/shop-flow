import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/core/utils/app_colors.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';
import 'package:shop_flow/features/home/presentation/manager/cart_cubit/cart_cubit.dart';

class IncrementProductWidget extends StatelessWidget {
  const IncrementProductWidget({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            context.read<CartCubit>().incrementProduct(product);
            context.read<CartCubit>().update(product);
          },
          child: Container(
            height: 30,
            width: 30,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: AppColors.primaryColor, shape: BoxShape.circle),
            child: SvgPicture.asset(Assets.imagesAdd),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (product.quantity > 1) {
              context.read<CartCubit>().decrementProduct(product);
              context.read<CartCubit>().update(product);
            } else {}
          },
          child: Container(
            height: 30,
            width: 30,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: AppColors.primaryColor, shape: BoxShape.circle),
            child: SvgPicture.asset(Assets.imagesMinus),
          ),
        ),
      ],
    );
  }
}
