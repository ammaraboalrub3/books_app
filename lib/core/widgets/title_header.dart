import 'package:bookly/constants.dart';
import 'package:bookly/core/util/app_styles.dart';
import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  const TitleHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorezinatalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Text(title, style: AppStyles.semiBold18)],
      ),
    );
  }
}
