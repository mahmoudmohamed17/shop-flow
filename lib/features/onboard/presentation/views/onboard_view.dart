import 'package:flutter/material.dart';
import 'package:shop_flow/features/onboard/presentation/widgets/onboard_view_body.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({super.key});
  static const String id = 'onboard_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: OnboardViewBody(),
    );
  }
}
