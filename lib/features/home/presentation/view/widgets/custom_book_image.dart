import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 150 / 225,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          placeholder: (_, __) =>
              const Icon(Icons.image, size: 5, color: Colors.grey),
          errorWidget: (_, __, ___) =>
              const Icon(Icons.broken_image, size: 5, color: Colors.redAccent),
          imageUrl: image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
