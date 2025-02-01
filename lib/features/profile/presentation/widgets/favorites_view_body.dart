import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/features/home/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:shop_flow/features/profile/presentation/widgets/favorites_empty_body.dart';
import 'package:shop_flow/features/profile/presentation/widgets/favorites_filled_body.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesInitial) {
          return FavoritesEmptyBody();
        } else if (state is FavoritesFilled) {
          return FavoritesFilledBody(
            products: state.products,
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
