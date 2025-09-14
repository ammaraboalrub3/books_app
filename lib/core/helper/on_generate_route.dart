import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/view/book_detailes_view.dart';
import 'package:bookly/features/home/presentation/view/home_view.dart';
import 'package:bookly/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => SplashView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => HomeView());
    case BookDetailesView.routeName:
      return MaterialPageRoute(
        builder: (context) =>
            BookDetailesView(bookEntity: settings.arguments as BookEntity),
      );

    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
