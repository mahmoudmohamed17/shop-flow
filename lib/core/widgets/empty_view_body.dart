import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/widgets/custom_button.dart';
import 'package:shop_flow/features/home/presentation/views/categories_search_view.dart';

class EmptyViewBody extends StatelessWidget {
  const EmptyViewBody({
    super.key,
    required this.images,
    required this.title,
  });
  final String images, title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        spacing: 24,
        children: [
          Image.asset(
            images,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
          Text(
            textAlign: TextAlign.center,
            title,
            style: AppStyles.regular24,
          ),
          CustomButton(
            label: 'Explore Categories',
            onPressed: () {
              Navigator.pushNamed(context, CategoriesSearchView.id);
            },
          ),
        ],
      ),
    );
  }
}
