import 'package:flutter/material.dart';
import 'package:shop_flow/features/home/data/models/color_model.dart';
import 'package:shop_flow/features/home/presentation/widgets/color_item.dart';

class ColorsList extends StatefulWidget {
  const ColorsList({super.key});

  @override
  State<ColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  int activeIndex = 0;
  final List<ColorModel> colors = [
    ColorModel(name: 'Red', color: Colors.red),
    ColorModel(name: 'Blue', color: Colors.blue),
    ColorModel(name: 'Yellow', color: Colors.yellow),
    ColorModel(name: 'Green', color: Colors.green),
    ColorModel(name: 'Black', color: Colors.black),
    ColorModel(name: 'Teal', color: Colors.teal),
    ColorModel(name: 'Cyan', color: Colors.cyan),
    ColorModel(name: 'Grey', color: Colors.grey),
    ColorModel(name: 'Indigo', color: Colors.indigo),
    ColorModel(name: 'Pink', color: Colors.pink),
    ColorModel(name: 'Purple', color: Colors.purple),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(colors.length, (index) {
        return GestureDetector(
            onTap: () {
              setState(() {
                activeIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ColorItem(
                isSelected: activeIndex == index,
                colorModel: colors[index],
              ),
            ));
      }),
    );
  }
}
