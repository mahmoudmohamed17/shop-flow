import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/presentation/widgets/size_item.dart';

class SizesList extends StatefulWidget {
  const SizesList({super.key});

  @override
  State<SizesList> createState() => _SizesListState();
}

class _SizesListState extends State<SizesList> {
  int activeIndex = 0;
  final List<String> sizes = [
    'S',
    'M',
    'L',
    'XL',
    '2XL',
    '3XL',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(sizes.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              activeIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child:
                SizeItem(isSelected: activeIndex == index, size: sizes[index]),
          ),
        );
      }),
    );
  }
}
