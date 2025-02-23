import 'package:flutter/material.dart';
import 'package:shop_flow/features/profile/presentation/widgets/favorites_view_body.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});
  static const String id = 'favorites_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FavoritesViewBody(),
    );
  }
}
