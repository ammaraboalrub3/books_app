import 'package:bookly/core/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackgroundColor,
      foregroundColor: Colors.white,
    ),
    textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
  );
}

ThemeData lighTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightBackgroundColor,
      foregroundColor: Colors.black,
    ),
    textTheme: GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackgroundColor,
  );
}
