import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/extensions/context_extension.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/home/presentation/widgets/sizes_list.dart';

class SizeSelectionWidget extends StatelessWidget {
  const SizeSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        sizeSelectionLogic(context);
      },
      child: Container(
        decoration: BoxDecoration(
            color: borderFillColor,
            borderRadius: BorderRadiusDirectional.circular(100)),
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Size',
              style: AppStyles.regular16,
            ),
            Row(
              spacing: 32,
              children: [
                Text(
                  'S',
                  style: AppStyles.bold16,
                ),
                GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(Assets.imagesArrowDown)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> sizeSelectionLogic(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ListView(
              children: [
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: context.width * 0.33,
                  children: [
                    Text(
                      'Size',
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
                SizesList(),
              ],
            ),
          );
        });
  }
}
