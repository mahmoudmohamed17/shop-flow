import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/core/widgets/custom_button.dart';
import 'package:shop_flow/features/home/presentation/views/categories_search_view.dart';

class CartEmptyBody extends StatelessWidget {
  const CartEmptyBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(Assets.imagesBackgroundArrowBack)),
            ],
          ),
        ),
        Expanded(child: SizedBox()),
        Image.asset(Assets.imagesCart),
        Text('Your Cart is Empty', style: AppStyles.medium24),
        CustomButton(
          label: 'Explore Categories',
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, CategoriesSearchView.id,
                (Route<dynamic> route) => route.isFirst);
          },
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }
}
