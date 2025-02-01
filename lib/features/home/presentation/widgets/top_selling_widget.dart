import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/features/home/data/models/top_selling_new_in_model.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';
import 'package:shop_flow/features/home/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:shop_flow/features/home/presentation/views/top_selling_and_new_in_details_view.dart';
import 'package:shop_flow/features/home/presentation/widgets/top_selling_list.dart';

class TopSellingWidget extends StatelessWidget {
  const TopSellingWidget({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return Column(
          spacing: 16,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Selling',
                  style: AppStyles.bold16,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, TopSellingAndNewInDetailsView.id,
                        arguments: TopSellingNewInModel(
                            label: 'Top Selling', products: products));
                  },
                  child: Text(
                    'See All',
                    style: AppStyles.regular16,
                  ),
                ),
              ],
            ),
            TopSellingList(
              products: products,
            ),
          ],
        );
      },
    );
  }
}
