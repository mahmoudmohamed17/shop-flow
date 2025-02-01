import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_colors.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/features/home/data/models/color_model.dart';

class SelectedColorItem extends StatelessWidget {
  const SelectedColorItem({super.key, required this.colorModel});
  final ColorModel colorModel;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppColors.primaryColor,
      ),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            colorModel.name,
            style: AppStyles.medium16.copyWith(color: Colors.white),
          ),
          Row(
            spacing: 24,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 12,
                child: CircleAvatar(
                  radius: 9,
                  backgroundColor: colorModel.color,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class UnselectedColorItem extends StatelessWidget {
  const UnselectedColorItem({super.key, required this.colorModel});
  final ColorModel colorModel;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: borderFillColor,
      ),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            colorModel.name,
            style: AppStyles.medium16,
          ),
          Row(
            spacing: 24,
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: colorModel.color,
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.check,
                  color: Colors.transparent,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
