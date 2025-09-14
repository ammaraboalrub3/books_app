import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/view/book_detailes_view.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_image_item.dart';
import 'package:flutter/material.dart';

class CustomImageItemListView extends StatelessWidget {
  const CustomImageItemListView({super.key, required this.book});

  final List<BookEntity> book;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: book.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                BookDetailesView.routeName,
                arguments: book[index],
              );
            },
            child: CustomBookItem(bookEntity: book[index]),
          ),
        );
      },
    );
  }
}
