import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imggeUrl});

  final String imggeUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
          aspectRatio: 2 / 3,
          child: CachedNetworkImage(
              placeholder: (context, url) => const CustomLoadingIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.fill,
              imageUrl: imggeUrl)),
    );
  }
}
