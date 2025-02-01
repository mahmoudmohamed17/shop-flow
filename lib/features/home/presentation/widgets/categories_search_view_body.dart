import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/home/presentation/widgets/search_categories_list.dart';

class CategoriesSearchViewBody extends StatelessWidget {
  const CategoriesSearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            SizedBox(height: 8,),
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(Assets.imagesBackgroundArrowBack)),
              ],
            ),
            Text(
              'Shop by Categories',
              style: AppStyles.bold24,
            ),
            SearchCategoriesList(),
          ],
        ),
      ),
    );
  }
}
