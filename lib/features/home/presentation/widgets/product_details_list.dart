import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/extensions/context_extension.dart';
import 'package:shop_flow/core/utils/app_colors.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';
import 'package:shop_flow/features/home/presentation/widgets/product_images_list.dart';
import 'package:shop_flow/features/home/presentation/widgets/qunatity_selection_widget.dart';
import 'package:shop_flow/features/home/presentation/widgets/reviews_list.dart';

class ProductDetailsList extends StatelessWidget {
  const ProductDetailsList({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: context.height * 0.35,
          child: ProductImagesList(
            images: productEntity.imagesList,
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productEntity.title,
                style: AppStyles.bold16,
              ),
              Text(
                r'$' '${productEntity.price}',
                style: AppStyles.bold16.copyWith(color: AppColors.primaryColor),
              ),
              SizedBox(
                height: 18,
              ),
              // Keep these two widgets to a later projects
              // SizeSelectionWidget(),
              // ColorSelectionWidget(),
              QunatitySelectionWidget(
                product: productEntity,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                productEntity.description,
                style: AppStyles.regular12.copyWith(
                  color: subTextColor,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Shipping & Returns',
                style: AppStyles.bold16,
              ),
              Text(
                productEntity.returnPolicy,
                style: AppStyles.regular12.copyWith(color: subTextColor),
              ),
              SizedBox(
                height: 12,
              ),
              Text('Reviews', style: AppStyles.bold16),
              Text('${productEntity.rating} Ratings', style: AppStyles.bold24),
              Text(
                '${productEntity.reviewsCount} Reviews',
                style: AppStyles.regular12.copyWith(color: subTextColor),
              ),
              ReviewsList(
                reviews: productEntity.reviewsList,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
