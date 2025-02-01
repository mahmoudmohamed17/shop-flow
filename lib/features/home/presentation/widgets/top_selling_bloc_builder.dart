import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/features/home/presentation/manager/products_cubit/products_cubit.dart';
import 'package:shop_flow/features/home/presentation/widgets/top_selling_widget.dart';

class TopSellingBlocBuilder extends StatelessWidget {
  const TopSellingBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return TopSellingWidget(
            products: context.read<ProductsCubit>().topSellingProducts,
          );
        } else if (state is ProductsFailure) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              'Failed to laod products!',
              style: AppStyles.regular16,
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
