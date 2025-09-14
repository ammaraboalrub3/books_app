import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/view/book_detailes_view.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class CustomBookImageListView extends StatelessWidget {
  const CustomBookImageListView({super.key, required this.book});

  final List<BookEntity> book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.25,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: book.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    BookDetailesView.routeName,
                    arguments: book[index],
                  );
                },
                child: CustomBookImage(image: book[index].image ?? ""),
              ),
            );
          },
        ),
      ),
    );
  }
}
