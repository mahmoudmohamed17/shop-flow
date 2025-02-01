import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/extensions/context_extension.dart';
import 'package:shop_flow/core/utils/app_styles.dart';

class ProductImagesList extends StatefulWidget {
  const ProductImagesList({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  State<ProductImagesList> createState() => _ProductImagesListState();
}

class _ProductImagesListState extends State<ProductImagesList> {
  int currentIndex = 0;
  late ScrollController controller;
  @override
  void initState() {
    controller = ScrollController();
    controller.addListener(onScroll);
    super.initState();
  }

  void onScroll() {
    final double offset = controller.offset;
    final int newIndex = (offset / context.width).round();
    if (newIndex != currentIndex) {
      setState(() {
        currentIndex = newIndex;
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: widget.images.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                width: context.width,
                decoration: BoxDecoration(
                  color: borderFillColor,
                ),
                child: CachedNetworkImage(
                  imageUrl: widget.images[index],
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              );
            }),
        Positioned(
          top: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              '${currentIndex + 1}/${widget.images.length}',
              style: AppStyles.regular12,
            ),
          ),
        )
      ],
    );
  }
}
