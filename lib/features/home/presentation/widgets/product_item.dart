import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/extensions/context_extension.dart';
import 'package:shop_flow/core/funcs/build_snack_bar.dart';
import 'package:shop_flow/core/funcs/load_product_state.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';
import 'package:shop_flow/features/home/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:shop_flow/features/home/presentation/views/product_details_view.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            loadProductState(productEntity);
            Navigator.pushNamed(
              context,
              ProductDetailsView.id,
              arguments: productEntity,
            );
          },
          child: Stack(
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: context.width * 0.45),
                decoration: BoxDecoration(
                  color: borderFillColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CachedNetworkImage(
                      height: context.height * 0.3,
                      imageUrl: productEntity.imagesList.isEmpty
                          ? Assets.imagesShoppingBag
                          : productEntity.imagesList[0],
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: FractionallySizedBox(
                          widthFactor: 0.8,
                          child: Text(
                            productEntity.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.regular12,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: FractionallySizedBox(
                          widthFactor: 0.8,
                          child: Text(
                            r'$' '${productEntity.price}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.bold12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    onTap: () {
                      if (productEntity.isAddedToFavorites) {
                        context
                            .read<FavoritesCubit>()
                            .deleteFromFavorite(productEntity);
                        buildSnackBar(
                            context, 'Product removed from Favorites.');
                      } else {
                        context
                            .read<FavoritesCubit>()
                            .addToFavorites(productEntity);
                        buildSnackBar(context, 'Product added to Favorites!');
                      }
                    },
                    child: SvgPicture.asset(
                      productEntity.isAddedToFavorites
                          ? Assets.imagesHeartSelected
                          : Assets.imagesHeart,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
