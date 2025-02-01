import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_colors.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';
import 'package:shop_flow/features/home/presentation/manager/cart_cubit/cart_cubit.dart';

class QunatitySelectionWidget extends StatelessWidget {
  const QunatitySelectionWidget({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              color: borderFillColor,
              borderRadius: BorderRadiusDirectional.circular(100)),
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Qunatity',
                style: AppStyles.regular16,
              ),
              Row(
                spacing: 10,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<CartCubit>().incrementProduct(product);
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle),
                      child: SvgPicture.asset(Assets.imagesAdd),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                    child: Text(
                      textAlign: TextAlign.center,
                      product.quantity.toString(),
                      style: AppStyles.regular16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<CartCubit>().decrementProduct(product);
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle),
                      child: SvgPicture.asset(Assets.imagesMinus),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
