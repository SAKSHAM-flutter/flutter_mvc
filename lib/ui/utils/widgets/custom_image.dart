import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvc_flutter/ui/utils/base_class/loading.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.source,
    this.fit = BoxFit.contain,
    this.height,
    this.width,
    this.color,
    this.placeHolder,
  });
  final String source;
  final BoxFit fit;
  final double? height, width;
  final Color? color;
  final String? placeHolder;

  @override
  Widget build(BuildContext context) {
    // if (source.endsWith('.svg')) {
    //   return SizedBox(
    //     height: height,
    //     width: width,
    //     child: SvgPicture.asset(
    //       source,
    //       fit: fit,
    //       height: height,
    //       width: width,
    //       color: color,
    //     ),
    //   );
    // }
    if (source.startsWith('http') ||
        source.startsWith('https') ||
        source.startsWith('www.')) {
      return CachedNetworkImage(
        imageUrl: source,
        fit: fit,
        color: color,
        height: height,
        width: width,
        placeholder: (c, z) {
          if (placeHolder == null) {
            return ShimmerIndicator(
              isLoading: true,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: height,
                width: width,
              ),
            );
          } else {
            return Image.asset(
              placeHolder!,
              fit: fit,
              color: color,
              height: height,
              width: width,
              errorBuilder: (ctx, object, stack) => errorWidget(),
            );
          }
        },
        errorWidget: (ctx, object, stack) => errorWidget(),
      );
    }
    if (File(source).existsSync()) {
      return Image.file(
        File(source),
        fit: fit,
        color: color,
        height: height,
        width: width,
        errorBuilder: (ctx, object, stack) => errorWidget(),
      );
    }
    return Image.asset(
      source,
      fit: fit,
      color: color,
      height: height,
      width: width,
      errorBuilder: (ctx, object, stack) => errorWidget(),
    );
  }

  Widget errorWidget() {
    return SizedBox(
      height: height,
      width: width,
      child: Image.asset(
        'assets/icons/no_image.jpeg',
        fit: BoxFit.fill,
      ),
    );
  }
}
