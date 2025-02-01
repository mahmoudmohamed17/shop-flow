import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/data/models/color_model.dart';
import 'package:shop_flow/features/home/presentation/widgets/selected_and_unselected_color_item.dart';

class ColorItem extends StatelessWidget {
  const ColorItem(
      {super.key, required this.isSelected, required this.colorModel});
  final bool isSelected;
  final ColorModel colorModel;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? SelectedColorItem(
            colorModel: colorModel,
          )
        : UnselectedColorItem(
            colorModel: colorModel,
          );
  }
}
