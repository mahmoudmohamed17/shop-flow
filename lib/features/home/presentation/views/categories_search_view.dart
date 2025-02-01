import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/presentation/widgets/categories_search_view_body.dart';

class CategoriesSearchView extends StatelessWidget {
  const CategoriesSearchView({super.key});
  static const String id = 'categories_search_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CategoriesSearchViewBody(),
    );
  }
}
