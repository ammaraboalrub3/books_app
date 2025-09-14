import 'package:bookly/core/util/app_styles.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.backColor,
    required this.borderRadius,
    this.textColor,
    required this.text,
    required this.onTap,
  });

  final Color backColor;
  final String text;
  final Color? textColor;
  final BorderRadiusGeometry borderRadius;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: backColor,
            borderRadius: borderRadius,
          ),
          child: Center(
            child: Text(
              text,
              style: AppStyles.semiBold18.copyWith(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
