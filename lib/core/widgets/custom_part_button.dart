import 'package:flutter/material.dart';

import '../util/styles.dart';

class CustomPartButton extends StatelessWidget {
  const CustomPartButton({
    super.key,
    required this.color,
    required this.colorText,
    required this.borderRadius,
    required this.text,
    this.fontWeight,
  });

  final Color? color;
  final Color? colorText;
  final BorderRadiusGeometry? borderRadius;
  final String? text;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        decoration: BoxDecoration(color: color, borderRadius: borderRadius),
        child: Center(
            child: Text(
          text!,
          style: Styles.textStyle18
              .copyWith(color: colorText, fontWeight: fontWeight),
        )));
  }
}
