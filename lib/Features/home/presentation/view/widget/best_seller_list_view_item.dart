import 'package:bookly_app/Features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/core/util/app_router.dart';
import 'package:bookly_app/core/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import 'book_rating.dart';
import 'custom_book_image.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context)
              .push(AppRouter.kDetailsHomeView, extra: bookModel);
        },
        child: SizedBox(
          height: 120,
          child: Row(
            children: [
              CustomBookImage(
                imggeUrl: bookModel.volumeInfo.imageLinks.thumbnail,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(bookModel.volumeInfo.title!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle20.copyWith(
                            fontFamily: kPrimaryFont,
                          )),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(bookModel.volumeInfo.authors?.first ?? "book",
                        style: Styles.textStyle14.copyWith(color: Colors.grey)),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Text("Free",
                            style: Styles.textStyle20
                                .copyWith(fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.18,
                        ),
                        const BookRating(
                          rating: 10,
                          count: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
