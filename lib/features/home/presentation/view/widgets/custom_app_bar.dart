import 'package:bookly/constants.dart';
import 'package:bookly/core/util/app_images.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorezinatalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(Assets.imagesLogo),
          GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(Assets.imagesSearch),
          ),
        ],
      ),
    );
  }
}
