import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/features/home/presentation/manager/products_cubit/products_cubit.dart';
import 'package:shop_flow/features/home/presentation/widgets/new_in_widget.dart';

class NewInBlocBuilder extends StatelessWidget {
  const NewInBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return NewInWidget(
            products: context.read<ProductsCubit>().newInProducts,
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
