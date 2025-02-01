import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/funcs/build_snack_bar.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';
import 'package:shop_flow/features/home/presentation/manager/favorites_cubit/favorites_cubit.dart';

class CustomHeartWidget extends StatelessWidget {
  const CustomHeartWidget({
    super.key,
    required this.product,
  });
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (product.isAddedToFavorites) {
              context.read<FavoritesCubit>().deleteFromFavorite(product);
              buildSnackBar(context, 'Product removed from Favorites!');
            } else {
              context.read<FavoritesCubit>().addToFavorites(product);
              buildSnackBar(context, 'Product added to Favorites!');
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: borderFillColor,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(12),
            child: SvgPicture.asset(product.isAddedToFavorites
                ? Assets.imagesHeartSelected
                : Assets.imagesHeart),
          ),
        );
      },
    );
  }
}
