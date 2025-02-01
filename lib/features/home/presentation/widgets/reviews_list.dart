import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/data/models/review_model.dart';
import 'package:shop_flow/features/home/presentation/widgets/review_widget.dart';

class ReviewsList extends StatelessWidget {
  const ReviewsList({super.key, required this.reviews});
  final List<Map<String, dynamic>> reviews;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(reviews.length, (index) {
        return Padding(
          padding: EdgeInsets.only(bottom: index == 2 ? 0 : 12),
          child: ReviewWidget(
            reviewModel: ReviewModel.fromJson(reviews[index]),
          ),
        );
      }),
    );
  }
}
