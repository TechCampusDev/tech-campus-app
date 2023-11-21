import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UniversalImage extends StatelessWidget {
  const UniversalImage(
    this.src, {
    super.key,
    BoxFit? fit,
    this.width,
    this.height,
  }) : fit = fit ?? BoxFit.contain;

  final String src;
  final BoxFit fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final imageWidget = buildImage();
    if (width != null || height != null) {
      return SizedBox(
        width: width,
        height: height,
        child: imageWidget,
      );
    }
    return imageWidget;
  }

  Widget buildImage() {
    if (src.contains('.svg')) {
      if (src.contains(RegExp('^http|^https'))) {
        return SvgPicture.network(src, fit: fit);
      } else {
        return SvgPicture.asset(src, fit: fit);
      }
    } else {
      if (src.contains(RegExp('^http|^https'))) {
        return CachedNetworkImage(imageUrl: src, fit: fit);
      } else {
        return Image.asset(src, fit: fit);
      }
    }
  }

  static ImageProvider imageProvider(String src) {
    if (src.contains(RegExp('^http|^https'))) {
      return CachedNetworkImageProvider(src);
    } else {
      return AssetImage(src);
    }
  }
}
