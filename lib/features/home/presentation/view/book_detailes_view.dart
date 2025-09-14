import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_detailes_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailesView extends StatelessWidget {
  const BookDetailesView({super.key, required this.bookEntity});

  static const routeName = "book_detailes_view";
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BookDetailesViewBody(bookEntity: bookEntity)),
    );
  }
}
