import 'package:flutter/material.dart';
import 'package:shop_flow/features/onboard/presentation/widgets/dot_indicator.dart';

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({super.key, required this.activeIndex});
  final int activeIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        DotIndicator(isActive: activeIndex == 0),
        DotIndicator(isActive: activeIndex == 1),
        DotIndicator(isActive: activeIndex == 2),
      ],
    );
  }
}
