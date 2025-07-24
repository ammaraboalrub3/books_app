import 'package:bookly_app/core/util/styles.dart';
import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key, required this.errMessage});
  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      errMessage,
      style: Styles.textStyle30,
    ));
  }
}
