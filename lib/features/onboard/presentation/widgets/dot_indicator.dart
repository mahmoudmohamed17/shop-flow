import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_colors.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: 8,
      width: isActive ? 30 : 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : Color(0xffD3D3D3),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
