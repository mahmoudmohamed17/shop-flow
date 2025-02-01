import 'package:flutter/material.dart';
import 'package:shop_flow/features/onboard/presentation/widgets/first_onboard.dart';
import 'package:shop_flow/features/onboard/presentation/widgets/second_onboard.dart';
import 'package:shop_flow/features/onboard/presentation/widgets/third_onboard.dart';

class OnboardPageView extends StatelessWidget {
  const OnboardPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        FirstOnboard(),
        SecondOnboard(),
        ThirdOnboard(),
      ],
    );
  }
}
