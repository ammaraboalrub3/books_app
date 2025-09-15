import 'package:bookly/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar(
  BuildContext context,
  FeaturedBooksPaginationFailure state,
  String errorMessage,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(duration: Duration(seconds: 2), content: Text(errorMessage)),
  );
}
