import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/presentation/widgets/selected_and_unselected_size_item.dart';

class SizeItem extends StatelessWidget {
  const SizeItem({super.key, required this.isSelected, required this.size});
  final bool isSelected;
  final String size;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? SelectedSizeItem(
            size: size,
          )
        : UnselectedSizeItem(
            size: size,
          );
  }
}
