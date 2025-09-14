import 'package:bookly/constants.dart';
import 'package:bookly/core/util/app_images.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomDetailesAppBar extends StatelessWidget {
  const CustomDetailesAppBar({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorezinatalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.cancel_outlined, size: 32),
          ),
          GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(Assets.imagesCart),
          ),
        ],
      ),
    );
  }
}
