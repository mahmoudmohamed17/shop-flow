import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/core/widgets/custom_app_bar.dart';
import 'package:shop_flow/core/widgets/empty_view_body.dart';

class FavoritesEmptyBody extends StatelessWidget {
  const FavoritesEmptyBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            CustomAppBar(title: 'Favorites(0)'),
            Expanded(child: SizedBox()),
            EmptyViewBody(
              images: Assets.imagesSadHeartFace,
              title: 'You haven\'t added any Products yet!',
            ),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
