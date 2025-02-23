import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/core/utils/assets.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({super.key, required this.starsCount});
  final int starsCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: List.generate(5, (index) {
        return index < starsCount
            ? SvgPicture.asset(Assets.imagesStarColored)
            : SvgPicture.asset(Assets.imagesStarNotColored);
      }),
    );
  }
}
