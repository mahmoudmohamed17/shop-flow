import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/funcs/setup_date_formate.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/home/data/models/review_model.dart';
import 'package:shop_flow/features/home/presentation/widgets/rating_stars.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key, required this.reviewModel});
  final ReviewModel reviewModel;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Image.asset(
                Assets.imagesReviewer,
                height: 40,
                width: 40,
              ),
              title: Text(
                reviewModel.reviewerName,
                style: AppStyles.bold12,
              ),
              trailing: FittedBox(
                  child: RatingStars(
                starsCount: reviewModel.starsCount,
              )),
            ),
          ),
          Text(
            reviewModel.comment,
            style: AppStyles.medium12.copyWith(color: subTextColor),
          ),
          Text(
            setupDateFormate(reviewModel.date.substring(0, 10)),
            style: AppStyles.medium12,
          ),
        ],
      ),
    );
  }
}
