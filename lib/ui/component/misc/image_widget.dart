import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;

  final double? height;

  final double? width;

  const ImageWidget(
      {super.key, required this.imageUrl, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imageUrl,
      placeholder: (context, url) {
        return Center(
            child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary));
      },
    );
  }
}
