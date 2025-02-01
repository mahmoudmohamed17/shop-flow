import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/extensions/context_extension.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/home/presentation/widgets/colors_list.dart';

class ColorSelectionWidget extends StatelessWidget {
  const ColorSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        colorSelectionLogic(context);
      },
      child: Container(
        decoration: BoxDecoration(
            color: borderFillColor,
            borderRadius: BorderRadiusDirectional.circular(100)),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Color',
              style: AppStyles.regular16,
            ),
            Row(
              spacing: 32,
              children: [
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                ),
                SvgPicture.asset(Assets.imagesArrowDown),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> colorSelectionLogic(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: context.width * 0.33,
                children: [
                  Text(
                    'Color',
                    style: AppStyles.bold24,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(Assets.imagesXMark)),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              ColorsList(),
            ],
          );
        });
  }
}
