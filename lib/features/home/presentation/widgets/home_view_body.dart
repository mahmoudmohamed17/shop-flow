import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:shop_flow/features/home/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:shop_flow/features/home/presentation/manager/products_cubit/products_cubit.dart';
import 'package:shop_flow/features/home/presentation/views/cart_view.dart';
import 'package:shop_flow/features/home/presentation/widgets/categories_widget.dart';
import 'package:shop_flow/features/home/presentation/widgets/custom_search_body.dart';
import 'package:shop_flow/features/home/presentation/widgets/new_in_bloc_builder.dart';
import 'package:shop_flow/features/home/presentation/widgets/top_selling_bloc_builder.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getTopSellingProducts();
    context.read<ProductsCubit>().getNewInProducts();
    context.read<CartCubit>().getProductsFromDatabase();
    context.read<CartCubit>().getTotal();
    context.read<FavoritesCubit>().getFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 24,
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, CartView.id);
                      },
                      child: SvgPicture.asset(Assets.imagesCartShoppingButton)),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 24,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomSearchBody(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 24,
              ),
            ),
            SliverToBoxAdapter(
              child: CategoriesWidget(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 24,
              ),
            ),
            SliverToBoxAdapter(
              child: TopSellingBlocBuilder(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 24,
              ),
            ),
            SliverToBoxAdapter(
              child: NewInBlocBuilder(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
