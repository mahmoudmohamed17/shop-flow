import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/core/funcs/get_products_by_category.dart';
import 'package:shop_flow/core/funcs/load_product_state.dart';
import 'package:shop_flow/features/home/data/models/category_model.dart';
import 'package:shop_flow/features/home/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:shop_flow/features/home/presentation/widgets/category_details_view_body.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key, required this.model});
  static const String id = 'category_details_view';
  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    model.products.isEmpty
        ? {
            model.products = getProductsByCategory(model.title),
            for (var product in model.products)
              {
                loadProductState(product),
              }
          }
        : {};
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return Scaffold(
          body: CategoryDetailsViewBody(
            model: model,
          ),
        );
      },
    );
  }
}
