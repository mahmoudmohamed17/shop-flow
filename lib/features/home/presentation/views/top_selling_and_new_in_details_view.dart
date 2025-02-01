import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/data/models/top_selling_new_in_model.dart';
import 'package:shop_flow/features/home/presentation/widgets/top_selling_and_new_in_products_details_view_body.dart';

class TopSellingAndNewInDetailsView extends StatelessWidget {
  const TopSellingAndNewInDetailsView({super.key, required this.model});
  static const String id = 'top_selling_and_new_in_details_view';
  final TopSellingNewInModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TopSellingAndNewInProductsDetailsViewBody(
            title: model.label, products: model.products));
  }
}
